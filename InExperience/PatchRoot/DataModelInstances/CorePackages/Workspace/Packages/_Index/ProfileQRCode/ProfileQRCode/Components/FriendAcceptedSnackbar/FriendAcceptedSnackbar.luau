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

return function(p1)
	-- upvalues: useLocalUserInfoModule (ref), useTokens (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), view (ref), snackbar (ref)
	local var1 = useLocalUserInfoModule(p1.acceptedFriendUserId)
	local var2 = useTokens()
	local var3 = useLocalization({
		nowTrusted = {
			textKeysModule.NowTrusted,
			username = if var1 then var1.displayName or var1.username else nil
		},
		friendAdded = textKeysModule.QRFriendAdded
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		local delayedThread = task.delay(5, function()
			-- upvalues: p1 (copy)
			if p1.onDismissed then
				p1.onDismissed()
			end
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p1.onDismissed, p1.acceptedFriendUserId })
	
	return reactModule.createElement(view, { tag = "size-full", ZIndex = 101 }, {
		Message = reactModule.createElement(snackbar, {
			title = if p1.newFriendIsTrusted then var3.nowTrusted else var3.friendAdded,
			Position = UDim2.new(0.5, 0, 1, -var2.Size.Size_500),
			AnchorPoint = Vector2.new(0.5, 1)
		})
	})
end