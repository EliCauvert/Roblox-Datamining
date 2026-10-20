local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Snackbar = FoundationModule.Snackbar
local UseTokensFunction = FoundationModule.Hooks.useTokens
local TextKeysModule = require(ProfileQRCode.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLocalUserInfoModule = require(ProfileQRCode.Utils.useLocalUserInfo)

return function(p1)
	-- upvalues: UseLocalUserInfoModule (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), View (copy), Snackbar (copy)
	local UseLocalUserInfoModuleResult = UseLocalUserInfoModule(p1.acceptedFriendUserId)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		nowTrusted = {
			TextKeysModule.NowTrusted,
			username = if UseLocalUserInfoModuleResult then UseLocalUserInfoModuleResult.displayName or UseLocalUserInfoModuleResult.username else nil
		},
		friendAdded = TextKeysModule.QRFriendAdded
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		local DelayedThread = task.delay(5, function()
			-- upvalues: p1 (upval)
			if p1.onDismissed then
				p1.onDismissed()
			end
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { p1.onDismissed, p1.acceptedFriendUserId })
	
	return ReactModule.createElement(View, { tag = "size-full", ZIndex = 101 }, {
		Message = ReactModule.createElement(Snackbar, {
			title = if p1.newFriendIsTrusted then UseLocalizationResult.nowTrusted else UseLocalizationResult.friendAdded,
			Position = UDim2.new(0.5, 0, 1, -UseTokensResult.Size.Size_500),
			AnchorPoint = Vector2.new(0.5, 1)
		})
	})
end