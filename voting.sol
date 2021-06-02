
//Candidate, voter,votes, who can vote
//vote counts
//name
//voting for whom, what
//who wins - how many votes
// who can add candidate -> use modifier




pragma solidity ^0.4.21;
contract Election{
     struct Voter{
        bool authorized;
        bool voted;
        uint vote;
       
    }
    struct Candidate{
        string name;
        uint voteCount;
        
    }
  
  
    
    address public owner;
    string public electionName;
    
    mapping (address => Voter) public voters;
    Candidate[] public candidates;
    uint public totalVotes;
    
    modifier ownerOnly(){
        require(msg.sender == owner,"owner only");
        _;
    }
    //logic
    function Election(string _name) public{
    owner= msg.sender;
    electionName = _name;
    }
    
     
    function authorize(address _person) ownerOnly public{
        voters[_person].authorized = true;
    }
    
    
    function addCandidate(string _name) ownerOnly public{
        candidates.push(Candidate(_name,0));
    }
    
    function getNumCandidate() public view returns(uint){
     return candidates. length ;   
    }
   
    function vote(uint _voteIndex) public{
        require(!voters[msg.sender].voted,"already voted");
        require(voters[msg.sender].authorized,"you are authorized");
        voters[msg.sender].vote=_voteIndex;
        voters[msg.sender].voted=true;
        candidates[_voteIndex].voteCount +=1;
        totalVotes +=1;
    }
    
    function end() ownerOnly public{
        selfdestruct(owner);
    }
    
    }