local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ShareGame = RobloxGui.Modules.Settings.Pages.ShareGame
local ConstantsModule = require(ShareGame.Constants)
local StoppedToastTimerModule = require(ShareGame.Actions.StoppedToastTimer)
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local InviteStatus = ConstantsModule.InviteStatus
local Translator = require(ShareGame.getTranslator)()
local ErrorToaster = RoactModule.PureComponent:extend("ErrorToaster")

function ErrorToaster.restartTimer(p1)
	-- upvalues: RunService (copy)
	if not p1.timerConnection then
		p1.timerConnection = RunService.RenderStepped:Connect(function()
			-- upvalues: p1 (copy)
			local FailedInvites = p1.props.failedInvites
			
			if #FailedInvites == 0 then
				p1:stopTimer()
				
				return
			end
			if FailedInvites[#FailedInvites].timeStamp + 4 < tick() then
				p1:stopTimer()
			end
		end)
	end
end

function ErrorToaster.stopTimer(p1)
	if p1.timerConnection then
		p1.timerConnection:Disconnect()
		p1.timerConnection = nil
	end
	p1.props.stoppedTimerDispatch()
end

function ErrorToaster.didUpdate(p1)
	if #p1.props.failedInvites ~= 0 then
		p1:restartTimer()
	end
end

function ErrorToaster.render(p1)
	-- upvalues: ConstantsModule (copy), InviteStatus (copy), RoactModule (copy), ThemeModule (copy), Translator (copy)
	local FailedInvites = p1.props.failedInvites
	local TOASTHEIGHT = ConstantsModule.LayoutSpecific[p1.props.deviceLayout].TOAST_HEIGHT
	
	if #FailedInvites == 0 then return end
	local v1: string? = nil
	local Status = FailedInvites[#FailedInvites].status
	
	if Status == InviteStatus.Moderated then
		v1 = "Feature.SettingsHub.Label.ModeratedInviteError"
	else
		if Status ~= InviteStatus.Failed then return end
		v1 = "Feature.SettingsHub.Label.GameInviteError"
	end
	return RoactModule.createElement("ScreenGui", {
		DisplayOrder = 2,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		ToastFrame = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = ConstantsModule.Color.RED,
			Position = UDim2.new(0.5, 0, 0, 0),
			Size = UDim2.new(0.5, 0, 0, TOASTHEIGHT)
		}, {
			InnerTextPadding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 6),
				PaddingRight = UDim.new(0, 6)
			}),
			ToastText = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Font = ThemeModule.font(Enum.Font.SourceSansSemibold, "Semibold"),
				Size = UDim2.new(1, 0, 1, 0),
				Text = Translator:FormatByKey(v1),
				TextColor3 = ConstantsModule.Color.WHITE,
				TextSize = ThemeModule.textSize(16)
			})
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1)
	return {
		deviceLayout = p1.DeviceInfo.DeviceLayout,
		failedInvites = p1.Toasts.failedInvites
	}
end, function(Callback)
	-- upvalues: StoppedToastTimerModule (copy)
	return {
		stoppedTimerDispatch = function()
			-- upvalues: Callback (copy), StoppedToastTimerModule (upval)
			Callback(StoppedToastTimerModule())
		end
	}
end)(ErrorToaster)