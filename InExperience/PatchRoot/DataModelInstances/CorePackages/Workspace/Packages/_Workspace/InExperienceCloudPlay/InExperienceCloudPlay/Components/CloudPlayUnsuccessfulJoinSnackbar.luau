local GuiService = game:GetService("GuiService")
local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local Parent = InExperienceCloudPlay.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local DefaultLoadingScreenModule = require(InExperienceCloudPlay.DefaultLoadingScreen)
local UnsuccessfulJoinModule = require(InExperienceCloudPlay.UnsuccessfulJoin)
local IconName = FoundationModule.Enums.IconName
local Snackbar = FoundationModule.Snackbar
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CloudPlayUnsuccessfulJoinSnackbarSeconds = game:DefineFastInt("CloudPlayUnsuccessfulJoinSnackbarSeconds", 7)

local function _()
	-- upvalues: GuiService (copy)
	return GuiService:GetInsetArea(Enum.ScreenInsets.None).Max.Y - GuiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets).Max.Y
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UnsuccessfulJoinModule (copy), CloudPlayUnsuccessfulJoinSnackbarSeconds (copy), DefaultLoadingScreenModule (copy), View (copy), GuiService (copy), Snackbar (copy), IconName (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UnsuccessfulJoinModule (upval), UseStateResult2 (copy), CloudPlayUnsuccessfulJoinSnackbarSeconds (upval), DefaultLoadingScreenModule (upval)
		if not UnsuccessfulJoinModule.consumeUnsuccessfulJoin() then return end
		local Flag = false
		local Callback = nil
		
		local function show()
			-- upvalues: Flag (ref), UseStateResult2 (upval), CloudPlayUnsuccessfulJoinSnackbarSeconds (upval)
			if not Flag then
				UseStateResult2(true)
				task.delay(CloudPlayUnsuccessfulJoinSnackbarSeconds, function()
					-- upvalues: Flag (upval), UseStateResult2 (upval)
					if not Flag then
						UseStateResult2(false)
					end
				end)
				
				return
			end
		end
		
		if DefaultLoadingScreenModule.isRemoved() then
			if not Flag then
				UseStateResult2(true)
				task.delay(CloudPlayUnsuccessfulJoinSnackbarSeconds, function()
					-- upvalues: Flag (ref), UseStateResult2 (upval)
					if not Flag then
						UseStateResult2(false)
					end
				end)
			end
		else
			Callback = DefaultLoadingScreenModule.subscribeRemoved(show)
		end
		return function()
			-- upvalues: Flag (ref), Callback (ref)
			Flag = true
			
			if Callback then
				Callback()
			end
		end
	end, {})
	
	return if UseStateResult then ReactModule.createElement(View, {
		tag = "anchor-bottom-center auto-xy",
		testId = "cloud-play-unsuccessful-join-snackbar-anchor",
		Position = UDim2.new(0.5, 0, 1, -UseTokensResult.Padding.XLarge - (if p1.insetFromDeviceSafeArea then GuiService:GetInsetArea(Enum.ScreenInsets.None).Max.Y - GuiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets).Max.Y else 0))
	}, {
		Snackbar = ReactModule.createElement(Snackbar, {
			title = "Cloud Play isn't working. You're playing normally.",
			LayoutOrder = 1,
			testId = "cloud-play-unsuccessful-join-snackbar",
			icon = IconName.TriangleExclamation
		})
	}) else nil
end