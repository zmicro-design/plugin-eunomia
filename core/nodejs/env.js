const fs = require('fs');

const ignoreKeys = [
  'SHELL',
  'PWD',
  'USER',
  'LOGNAME',
  'HOME',
  'PATH',
  'LANG',
  'TERM',
  'SHLVL',
  'EUNOMIA_ENV_FILE',
  // flow
  'execute_cmd',
];

const ignoreKeysMap = {};
ignoreKeys.forEach((key) => {
  ignoreKeysMap[key] = true;
});

function decode(text) {
  return Buffer.from(text, 'base64').toString('utf8');
}

function isBase64(str) {
  const base64Regex = /^[a-zA-Z0-9+/]*={0,2}$/;
  if (!base64Regex.test(str)) {
    return false; // 不符合 Base64 编码规范
  }

  try {
    return Buffer.from(str, 'base64').toString('base64') === str;
  } catch (error) {
    return false;
  }
}

function isReadable(str) {
  // ascii
  if (/^[\x00-\x7F]+$/.test(str)) {
    return true;
  }

  // unicode 
  if (/^[\u4E00-\u9FFF]+$/u.test(str)) {
    return true;
  }

  // // unicode readable
  // if (/^[\x20-\x7E\u00A0-\u{10FFFF}]+$/u.test(str)) {
  //   return true;
  // }

  return false;
}

function main() {
  const writeFileName = process.env.PLUGIN_EUNOMIA_DEPLOYMENT_DOT_ENV
  if (!writeFileName) {
    throw new Error('env PLUGIN_EUNOMIA_DEPLOYMENT_DOT_ENV is not set');
  }

  const env = process.env;
  let new_envs = [];
  for (const key in env) {
    if (ignoreKeysMap[key]) continue;
    
    let value = env[key];

    if (process.env.FLOW_CI === 'true') {
      if (!isBase64(env[key])) continue;

      value = decode(env[key]);
      if (!isReadable(value)) continue;
    }

    new_envs.push(`${key}=${JSON.stringify(value)}`);
  }

  console.log('write deployment dot env file:', writeFileName);
  fs.writeFileSync(writeFileName, new_envs.join('\n'));
}

main();
