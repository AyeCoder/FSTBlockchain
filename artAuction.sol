pragma solidity 0.8.0;

contract artAuction{
    address internal auction_owner;
    uint public auction_start;
    uint public auction_end;
    uint public highestBid;
    address highestBidder;
    enum auction_state{
        Cancelled,Started
    }
    struct art{
        string artType;
        string artNumber;
    }
    art public myArt;
    address[] bidders;
    mapping(address => uint)public bids; 
    auction_state public State;
    modifier an_ongoing_auction() { require(now <= auction_end);
    _;
    }
    modifier only_owner(){require(msg.sender == auction_owner);
    _;
    }
    function bid() public payable an_ongoing_auction returns (bool){}
    function withdraw() public returns (bool){}
    function cancel_auction()external returns(bool){}
    
    event BidEvent(address indexed highestBidder, uint highestBid);
    event withdrawalEvent(address withdraw, uint amount);
    event CancelledEvent(string message, uint time);
}