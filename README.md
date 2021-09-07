# Unit Test Solidity Contracts

## Installation
First run a sudo command like `sudo true` to make sure you have sudo rights before you run sudo apt install npm (I think otherwise the next line with the `npm install` might be seen as a password attempt). 
```
git clone git@github.com:a-t-2/chainlink.git
git clone git@github.com:a-t-2/test_vrf3.git
cd test_vrf3
sudo apt install npm
npm install
npm audit fix
npm install --save-dev ethereum-waffle
npm install @openzeppelin/contracts -D
npm i chai -D
npm i mocha -D
npx waffle
npx mocha
npm test
```
## Testing
Everytime you change something in the code, and you want to test it, run:
```
npx waffle
npx mocha
npm test
```
