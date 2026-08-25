local corePackagesService = game:GetService("CorePackages")
local runService = game:GetService("RunService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local constantsModule = require(shareGame.Constants)
local stoppedToastTimerModule = require(shareGame.Actions.StoppedToastTimer)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local inviteStatus = constantsModule.InviteStatus
local var8 = require(shareGame.getTranslator)()
local errorToaster = roactModule.PureComponent:extend("ErrorToaster")

function errorToaster.restartTimer(p0)
	-- upvalues: runService (ref)
	if not p0.timerConnection then
		p0.timerConnection = runService.RenderStepped:Connect(function()
			-- upvalues: p0 (ref)
			local failedInvites = p0.props.failedInvites
			
			if #failedInvites == 0 then
				p0:stopTimer()
				
				return
			elseif failedInvites[#failedInvites].timeStamp + 4 < tick() then
				p0:stopTimer()
			end
		end)
	end
end

function errorToaster.stopTimer(p1)
	if p1.timerConnection then
		p1.timerConnection:Disconnect()
		p1.timerConnection = nil
	end
	p1.props.stoppedTimerDispatch()
end

function errorToaster.didUpdate(p2)
	if #p2.props.failedInvites ~= 0 then
		p2:restartTimer()
	end
end

function errorToaster.render(p3)
	-- upvalues: constantsModule (ref), inviteStatus (ref), roactModule (ref), themeModule (ref), var8 (ref)
	local failedInvites = p3.props.failedInvites
	local TOAST_HEIGHT = constantsModule.LayoutSpecific[p3.props.deviceLayout].TOAST_HEIGHT
	
	if #failedInvites == 0 then return end
	local var10 = nil
	local status = failedInvites[#failedInvites].status
	
	if status == inviteStatus.Moderated then
		var10 = "Feature.SettingsHub.Label.ModeratedInviteError"
	elseif status == inviteStatus.Failed then
		var10 = "Feature.SettingsHub.Label.GameInviteError"
	else
		return
	end
	return roactModule.createElement("ScreenGui", {
		DisplayOrder = 2,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		ToastFrame = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = constantsModule.Color.RED,
			Position = UDim2.new(0.5, 0, 0, 0),
			Size = UDim2.new(0.5, 0, 0, TOAST_HEIGHT)
		}, {
			InnerTextPadding = roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 6),
				PaddingRight = UDim.new(0, 6)
			}),
			ToastText = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Font = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold"),
				Size = UDim2.new(1, 0, 1, 0),
				Text = var8:FormatByKey(var10),
				TextColor3 = constantsModule.Color.WHITE,
				TextSize = themeModule.textSize(16)
			})
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p4)
	return {
		deviceLayout = p4.DeviceInfo.DeviceLayout,
		failedInvites = p4.Toasts.failedInvites
	}
end, function(p5)
	-- upvalues: stoppedToastTimerModule (ref)
	return {
		stoppedTimerDispatch = function()
			-- upvalues: p5 (ref), stoppedToastTimerModule (copy)
			p5(stoppedToastTimerModule())
		end
	}
end)(errorToaster)