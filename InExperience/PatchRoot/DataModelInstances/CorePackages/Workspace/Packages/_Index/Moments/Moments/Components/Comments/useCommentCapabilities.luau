local Parent = script:FindFirstAncestor("Moments").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsReactModule = require(Parent.SignalsReact)
local GetMomentsCapabilitiesFunction = require(Parent.MomentsCommon).Stores.GetMomentsCapabilities
local FFlagMomentsCommentsIxpEnabled = SharedFlagsModule.FFlagMomentsCommentsIxpEnabled
local Frozen = table.freeze({ canRead = true, canWrite = true, canReact = true })

local function useGuacCommentCapabilities() --[[ Line: 25 ]]
	-- upvalues: GetMomentsCapabilitiesFunction (copy), SignalsReactModule (copy)
	local MomentsCapabilities = GetMomentsCapabilitiesFunction(false)
	
	return {
		canRead = SignalsReactModule.useSignalState(MomentsCapabilities.getCanReadComments),
		canWrite = SignalsReactModule.useSignalState(MomentsCapabilities.getCanWriteComments),
		canReact = SignalsReactModule.useSignalState(MomentsCapabilities.getCanReactToComments)
	}
end

local function useAllowedCommentCapabilities() --[[ Line: 33 ]]
	-- upvalues: Frozen (copy)
	return Frozen
end

return if SharedFlagsModule.FFlagMomentsComments or FFlagMomentsCommentsIxpEnabled then useGuacCommentCapabilities else useAllowedCommentCapabilities