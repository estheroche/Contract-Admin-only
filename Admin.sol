//SPDX-License-Identifier:MIT
pragma solidity ^0.8.8 .0;

/* write a smart contract with solidity on  handling student details 
where ther details of a specific student can be 
updated or deleted by admin. and anyone can query the detatils for each student*/

contract StudentDetails {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    struct StudentInfo {
        string name;
        uint age;
        string department;
    }

    mapping(address => StudentInfo) public studentMap;
    uint public studentCount;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function defaultDetails() public {
        StudentInfo storage stud = studentMap[msg.sender];
        stud.name = "ego";
        stud.age = 12;
        stud.department = "fff";
    }

    function StudentInfosUpdate(
        string memory _name,
        uint _age,
        string memory _department
    ) public {
        StudentInfo storage studt = studentMap[msg.sender];
        studt.name = _name;
        studt.age = _age;
        studt.department = _department;
    }

    function updateName(address _address, string memory _name) public {
        StudentInfo storage studtt = studentMap[_address];
        require(msg.sender == _address, "not admin");
        studtt.name = _name;
    }

    function deleteDetails(address _address) public {
        delete (studentMap[_address]);
    }

    /* function defaultInfo(uint _id, string memory _name, uint _age, bool _isAstudent, string memory _department) public {
        StudentInfo storage stud = studentMap[_id];
        stud.name = "Ego";
        stud.age = 12;
        stud.isAstudent = true;
        stud.department = "Economics";
    }*/
}
