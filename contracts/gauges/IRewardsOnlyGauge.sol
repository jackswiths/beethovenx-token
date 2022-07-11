// SPDX-License-Identifier: GPL-3.0-or-later
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

pragma solidity 0.8.7;

import "./IChildChainStreamer.sol";

// For compatibility, we're keeping the same function names as in the original Curve code, including the mixed-case
// naming convention.
// solhint-disable func-name-mixedcase

interface IRewardsOnlyGauge {
    function initialize(
        address pool,
        address streamer,
        bytes32 claimSignature
    ) external;

    // solhint-disable-next-line func-name-mixedcase
    function lp_token() external view returns (IERC20);

    function reward_contract() external view returns (IChildChainStreamer);

    function set_rewards(
        address childChainStreamer,
        bytes32 claimSig,
        address[8] calldata rewardTokens
    ) external;

    function totalSupply() external view returns (uint256);

    function balanceOf(address _owner) external view returns (uint256);

    function claim_rewards(address user) external;

    function claimable_reward(address _addr, address _token)
        external
        view
        returns (uint256);

    function claimable_reward_write(address _addr, address _token)
        external
        returns (uint256);
}