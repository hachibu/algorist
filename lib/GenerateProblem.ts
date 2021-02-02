import * as fs from 'fs'

function template(name) {
  return `// https://leetcode.com/problems/${name}

import Tests from '../TestHelpers'

let tests = new Tests(
)

tests.run(
)`
}

function main() {
  let args = process.argv.slice(2)
  if (args.length < 2) {
    return
  }

  let num = parseInt(args[0], 10)
  if (isNaN(num)) {
    return
  }

  let path = args[1].split('/')
  let name = path[path.length - 1]
  let numStr = num.toString().padStart(4, '0')

  let file = `src/problems/${numStr}-${name}.test.ts`
  let data = template(name)

  if (fs.existsSync(file)) {
    return
  }

  fs.writeFileSync(file, data, 'utf8')
}

main()
