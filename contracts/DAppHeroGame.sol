pragma solidity ^0.5.0;

library SafeMath {
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }
    
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }
    
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }
    
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract DAppHeroGame {
    using SafeMath for uint256;
    uint256 public prizePool;
    uint256 public avgScore;
    
    struct Challenge {
        bool status;  // 0 = Ended; 1 = Started
        uint256 deposited;
    }
    
    mapping(address => Challenge) public userChallenge;
    
    constructor(uint256 _initialAvgScore) public {
        avgScore = _initialAvgScore;
    }
    
    function newChallenge() external payable {
        require(msg.value > 0);
        
        userChallenge[msg.sender].deposited = (userChallenge[msg.sender].deposited).add(msg.value);
        userChallenge[msg.sender].status = true;
        prizePool = prizePool.add(msg.value);
    }
    
    function claim(uint256 _score) external {
        require(userChallenge[msg.sender].deposited > 0 && userChallenge[msg.sender].status == true);
        
        if(_score > avgScore) {
            //Send original + 1% extra from pool
            (msg.sender).transfer((userChallenge[msg.sender].deposited).mul(101).div(100));
            prizePool = prizePool.sub((userChallenge[msg.sender].deposited).mul(101).div(100));
        }
        
        avgScore = avgScore.add(_score).div(2);
        userChallenge[msg.sender].deposited = 0;
        userChallenge[msg.sender].status = false;
    }
}