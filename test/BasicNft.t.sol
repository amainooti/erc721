// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;
import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;

    BasicNft public basicNft;

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();

        // Few notes strings are a special kind of array of bytes
        // Only primitive types can be compared meaning only uint, bool, address and string

        // There are 2 ways to compare strings in Solidity a test Instance
        // 1. using the assertEq function
        assertEq(actualName, expectedName);

        // 2. Using the keccak256 function and encoding it this way comparing the hash is better than trying to use something like a for loop to compare them
        
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }
}
