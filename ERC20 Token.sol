pragma solidity 0.5.6;

contract ERC20Token {
    // Variables
    string public name;
    string public symbol;
    uint8 public decimal;
    uint256 public supply; 

    mapping (address => uint) public balances;
    mapping (address => mapping (address => uint)) public allowed;

    constructor (string memory _name, string memory _symbol, uint8 _decimal, uint256 _supply) public {
        name = _name;
        symbol = _symbol;
        decimal = _decimal;
        supply = _supply;
        balances[msg.sender] = supply;
    }
    // Events
    event Transfer(address _sender, address _reciever, uint256 _tokens);
    event Approval(address sender, address delegate, uint256 _tokens);

    // Functions
    function totalSupply() external view returns (uint256) {
        return supply;
    }
    function balanceOf(address tokenOwner) external view returns (uint256) {
        return balances[tokenOwner];
    }
    function transfer(address _reciever, uint numTokens) external returns (bool) {
        require(msg.sender != _reciever)
        require(balances[msg.sender >= numTokens]);
        balances[msg.sender] -= numTokens
        balances[_reciever] += numTokens
        emit Transfer(msg.sender, _reciever, numTokens);
        return true; 
    }
    function approve(address delegate, uint numTokens) external view returns (bool) {
        require(msg.sender != delegate)
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }
    function allowance(address owner, address delegate) external view returns (bool) {
        return allowed[owner][delegate];
    }
    function transferFrom(address owner, address buyer, uint numTokens) external returns (bool) {
        require(balances[msg.sender] >= numTokens);
        require(allowed[owner][msg.sender] >= numTokens);
        balances[owner] -= numTokens
        balances[buyer] += numTokens
        allowed[owner][msg.semder] - numTokens
        emit Transfer(owner, buyer, numTokens)
    }
}
