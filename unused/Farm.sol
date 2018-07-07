pragma solidity ^0.4.21; // tells the compiler which version of solidity we're using

contract Farm {

    // structs: custom type, groups variables
    struct Animal {
        string name;
        uint age;
        bool mammal;
    }

    // mappings: kind of like a hash table, with keys and values
    mapping (address => Animal) public animals; // `public` automatically creates a getter function
    address public farmOwner;

    // events: interface for EVM logs (historical record)
    event NewAnimal(address animal, string name, uint age, bool mammal);

    // modifiers: semantic helper functions
    modifier onlyOwner {
        require(msg.sender == farmOwner); // conditional requirement check
        _; // function gets amended here
    }

    // constructor: optional function, executed on contract creation
    constructor() public {
        farmOwner = msg.sender;
    }

    function setAnimal(address _address, string _name, uint _age, bool _mammal) public onlyOwner {
        Animal storage animal = animals[_address];
        animal.name = _name;
        animal.age = _age;
        animal.mammal = _mammal;

        // emit an Event, which stores the values in EVM logs
        emit NewAnimal(_address, _name, _age, _mammal);
    }

    function changeFarmOwner(address _address) public onlyOwner returns (address newAddress) {
        farmOwner = _address;
        return farmOwner;
    }

    function getAnimalName(address _address) public constant returns (string name) {
        return animals[_address].name;
    }
}