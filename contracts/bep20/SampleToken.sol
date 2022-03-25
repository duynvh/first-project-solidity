pragma solidity ^0.8.4;

import "./IERC20.sol";

contract SampleToken is IERC20 {
    constructor() {
        _totalSupply = 1000000;
        _balances[msg.sender] = 1000000;
    }

    uint256 private _totalSupply;

    // mapping[address] => balances
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        require(_balances[msg.sender] >= amount);
        _balances[msg.sender] -= amount;
        _balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool) {
        require(_balances[from] >= amount);
        require(_allowances[from][msg.sender] >= amount);
        _balances[from] -= amount;
        _balances[to] += amount;

        emit Transfer(from, to, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function allowance(address owner, address spender)
        external
        view
        returns (uint256)
    {
        return _allowances[owner][spender];
    }
}
