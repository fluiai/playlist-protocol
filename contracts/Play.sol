pragma solidity ^0.4.18;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Play {

    using SafeMath for uint256;
    uint256 index;

    // structs: custom type, groups variables
    struct Question {
        uint index;
        address ownerAddress;
        string title;
        string desc;
    }

    struct Answer {
        uint index;
        address answerAddress;
        string link;
        string desc;
    }

    //mapping (uint => Question) public q; // `public` automatically creates a getter function

    Question[] public questions;
    Answer[] public answers;


    // events: interface for EVM logs (historical record)
    event SetQuestion(uint index, address questioner, string title,  string desc);
    event SetAnswer(uint index, address answerer, string link, string desc);

    // constructor: optional function, executed on contract creation
    constructor() public {
        //farmOwner = msg.sender;
        index = 0;
    }


    //Hello.setWord($("#name").val(),{from: web3.eth.accounts[0], gas:3000000});
    function setQuestion(address _address, string _title, string _desc) public {

        Question memory q = Question(index, msg.sender, _title, _desc);
        questions.push(q);

        // emit an Event, which stores the values in EVM logs
        emit SetQuestion(index, _address, _title, _desc);

        index = index.add(1);
    }


    function getQuestion(uint _index) public view returns (address ownerAddress, string title, string desc) {
        Question memory q = questions[_index];

        return (q.ownerAddress, q.title, q.desc);
    }

    //check exist
    function isExistAnswerAt(uint qIndex) public view returns(bool isIndeed)
    {
        if(answers.length == 0) return false;

        return (answers[qIndex].index == qIndex);
    }

    function setAnswer(uint _qIndex, string _link, string _desc) public {

        //Question memory q = questions[_qIndex];

        // if same address both questioner and answerer then throw
        // otherwise push answer
        //if (msg.sender == q.ownerAddress) throw;

        Answer memory a = Answer(_qIndex, msg.sender, _link, _desc);
        answers.push(a);

        emit SetAnswer(_qIndex, msg.sender, _link, _desc);
    }

    function getAnswer(uint _qIndex) public view returns (uint qIndex, address answerAddress, string link, string desc) {

        Answer memory a = answers[_qIndex];

        return (a.index, a.answerAddress, a.link, a.desc);

    }

    //refer to
    //https://medium.com/coinmonks/solidity-tutorial-returning-structs-from-public-functions-e78e48efb378
}