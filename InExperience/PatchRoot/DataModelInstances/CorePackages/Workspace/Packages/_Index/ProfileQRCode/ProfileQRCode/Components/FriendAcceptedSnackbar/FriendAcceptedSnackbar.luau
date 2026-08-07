local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local snackbar = foundationModule.Snackbar
local useTokens = foundationModule.Hooks.useTokens
local textKeysModule = require(profileQRCode.Common.TextKeys)
local useLocalization = localizationModule.Hooks.useLocalization
local useLocalUserInfoModule = require(profileQRCode.Utils.useLocalUserInfo)

return function(p0) --[[ line: 24 | named "FriendAcceptedSnackbar" ]]
	-- upvalues: useLocalUserInfoModule (ref), useTokens (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), view (ref), snackbar (ref)
	local var6 = useLocalUserInfoModule(p0.acceptedFriendUserId)
	local var7 = useTokens()
	local var8 = useLocalization({
		nowTrusted = {
			textKeysModule.NowTrusted,
			username = if var6 then var6.displayName or var6.username else nil
		},
		friendAdded = textKeysModule.QRFriendAdded
	})
	reactModule.useEffect(function() --[[ line: 36 ]]
		-- upvalues: p0 (ref)
		local delayedThread = task.delay(5, function() --[[ line: 37 ]]
			-- upvalues: p0 (copy)
			if p0.onDismissed then
				p0.onDismissed()
			end
		end)
		
		return function() --[[ line: 42 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p0.onDismissed, p0.acceptedFriendUserId })
	
	return reactModule.createElement(view, { tag = "size-full", ZIndex = 101 }, {
		Message = reactModule.createElement(snackbar, {
			title = if p0.newFriendIsTrusted then var8.nowTrusted else var8.friendAdded,
			Position = UDim2.new(0.5, 0, 1, -var7.Size.Size_500),
			AnchorPoint = Vector2.new(0.5, 1)
		})
	})
end