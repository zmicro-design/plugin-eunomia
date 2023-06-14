
async function main() {
  const response = await $`ls`

  console.log('response:', response.exitCode);

}

main()
