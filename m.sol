// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract clampfy66 {
    struct Memo {
        string name;
        string age;
        string doc;
        string history;
        string message;
        uint256 timestamp;
        address from;
    }

    Memo[] memos;
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function enterMsg(string memory name, string memory message,string memory age,string memory doc,string memory history) public payable {
        require(msg.value > 0, "Please pay greater than 0 ether");
        owner.transfer(msg.value);
        memos.push(Memo(name,age,doc,history ,message, block.timestamp, msg.sender));
    }

    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }
}
