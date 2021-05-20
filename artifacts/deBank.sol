pragma solidity 0.7.0;
contract deBank{
string public bName = "The Bank";
bool public isActive;
address public bUser;

function getSender() public view returns(uint){
    return(msg.sender).balance;
}
function getBalance() public view returns (uint){
    return address(this).balance;
}
function sendEther(address reciever) public payable{
    payable(reciever).transfer((msg.value)+2);
}
}