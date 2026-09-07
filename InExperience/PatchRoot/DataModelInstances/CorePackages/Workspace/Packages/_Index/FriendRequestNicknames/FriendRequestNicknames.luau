return {
	installReducer = require(script.installReducer),
	SetNicknameModal = require(script.Components.SetNicknameModalContainer),
	["jest.config"] = script["jest.config"],
	RoduxKey = require(script.Common.Constants).RODUX_KEY,
	FriendRequestNicknamesIXP = require(script.Experiments.FriendRequestNicknamesIXP)
}