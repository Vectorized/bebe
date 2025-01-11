// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {ERC7821} from "solady/accounts/ERC7821.sol";
import {ECDSA} from "solady/utils/ECDSA.sol";

/// @notice Basic EOA Batch Executor.
/// @author Solady (https://github.com/vectorized/solady)
contract BasicEOABatchExecutor is ERC7821 {
    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                     ERC1271 OPERATIONS                     */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    /// @dev Validates the signature with ERC1271 return.
    /// This enables the EOA to still verify regular ECDSA signatures if the contract
    /// checks that it has code and calls this function instead of `ecrecover`.
    function isValidSignature(bytes32 hash, bytes calldata signature)
        public
        view
        virtual
        returns (bytes4 result)
    {
        bool success = ECDSA.recoverCalldata(hash, signature) == address(this);
        /// @solidity memory-safe-assembly
        assembly {
            // `success ? bytes4(keccak256("isValidSignature(bytes32,bytes)")) : 0xffffffff`.
            // We use `0xffffffff` for invalid, in convention with the reference implementation.
            result := shl(224, or(0x1626ba7e, sub(0, iszero(success))))
        }
    }
}
