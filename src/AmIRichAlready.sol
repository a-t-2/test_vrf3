pragma solidity ^0.6.2;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}

contract AmIRichAlready {
    // define original variables
	IERC20 private tokenContract;
    uint public richness = 1000000 * 10 ** 18;

	// define askroot variables
	bool solved;    // Boolean to denote if contract is solved.
    address payable owner;  // Owner of the contract, first this is the sponser.
    uint expiry;        // Get the time when the contract expires.

    constructor (IERC20 _tokenContract) public {
        tokenContract = _tokenContract;
    }

    function check() public view returns (bool) {
        uint balance = tokenContract.balanceOf(msg.sender);
        return balance > richness;
    }

    // IS THIS NEEDED???: NO
    function setRichness(uint256 _richness) public {
      richness = _richness;
    }
	
	
	// Include askroot functions
	//function test(address payable hunter) public payable {
	function different_name(address payable hunter) public payable {
        TemplateSolveContract solver = TemplateSolveContract(msg.sender); // The message sender is the contract activating the test function.
        uint x = 100;                                   // Sample input.
        uint16 y = 10;                                  // Sample expected output.
        require(y == solver.main(x), "Wrong output");   // Require the output of the main function to be y.
        solved = true;                                  // Set solved to true.
        owner = hunter;                                 // Set the ownership to the hunter.
        owner.transfer(address(this).balance);          // Transfer the bounty to the hunter.
    }

    // Getter function for the solved variable.
    function getSolved() public view returns (bool){   
        return solved;
    }
    
    // Getter function for the Ownership.
    function getOwner() public view returns (address) { 
        return owner;
    }
    
    // Getter function for the balance of the contract.
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    // Refund method to claim the value of the contract after expiry.
    function refund() public {
        require(msg.sender == owner && block.timestamp >= expiry, "Contract is not expired yet");   // The sender must own the contract and the contract must be expired.
        selfdestruct(owner);    // Let the contract selfdestruct and move the value to the owner.
    }
}

// TemplateSolveContract so the TestContract knows the structure of the SolveContract.
abstract contract TemplateSolveContract {
	function main(uint x) public virtual returns (uint);
}
