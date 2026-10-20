local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local TModule = require(CorePackages.Packages.t)
local GetFFlagDisableAuthFailureRetryModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagDisableAuthFailureRetry)
game:DefineFastInt("AuthFailureMaxRetryDelay", 300)
local AccountAuthenticationFailureOverlay = RoactModule.PureComponent:extend("AccountAuthenticationFailureOverlay")
AccountAuthenticationFailureOverlay.validateProps = TModule.interface({
	onActivated = TModule.callback,
	screenSize = TModule.Vector2
})

local function _(p1: number): number
	return (math.min(2 ^ p1, game:GetFastInt("AuthFailureMaxRetryDelay")))
end

function AccountAuthenticationFailureOverlay.init(p1)
	p1.state = { countdownStarted = false, secondsRemaining = nil }
	p1.timesRetried = 0
	
	function p1.onRetry()
		-- upvalues: p1 (copy)
		p1:setState({ countdownStarted = true })
	end
end

function AccountAuthenticationFailureOverlay.didUpdate(p1, _, p2)
	if p1.state.countdownStarted and not p2.countdownStarted then
		p1:_onRetry()
	end
end

function AccountAuthenticationFailureOverlay._onRetry(p1)
	-- upvalues: RoactModule (copy)
	p1.props.onActivated()
	p1.timesRetried += 1
	local CurrentTime = tick()
	local Smallest = math.min(2 ^ p1.timesRetried, game:GetFastInt("AuthFailureMaxRetryDelay"))
	
	local function countDown()
		-- upvalues: p1 (copy), CurrentTime (copy), Smallest (copy), countDown (copy), RoactModule (upval)
		if p1.isMounted then
			local SmallestDelta = Smallest - (tick() - CurrentTime)
			
			if SmallestDelta > 0 then
				p1:setState({ secondsRemaining = math.round(SmallestDelta) })
				task.delay(1, countDown)
				
				return
			else
				p1:setState({
					countdownStarted = false,
					secondsRemaining = RoactModule.None
				})
			end
		end
	end
	
	countDown()
end

function AccountAuthenticationFailureOverlay.render(p1)
	-- upvalues: GetFFlagDisableAuthFailureRetryModule (copy), WithLocalizationFunction (copy), RoactModule (copy), InteractiveAlert (copy), Images (copy), ButtonType (copy)
	local RetryButtonText = nil
	local BodyText = nil
	if GetFFlagDisableAuthFailureRetryModule() then
		RetryButtonText = "Authentication.Login.Action.ConnectionError.RetryReady"
		BodyText = "Authentication.Login.Label.ConnectionError.RetryDisabled"
	elseif p1.state.countdownStarted then
		RetryButtonText = "Authentication.Login.Action.ConnectionError.RetryWait"
		BodyText = "Authentication.Login.Label.ConnectionError.RetryWait"
	else
		RetryButtonText = "Authentication.Login.Action.ConnectionError.RetryReady"
		BodyText = "Authentication.Login.Label.ConnectionError.RetryReady"
	end
	return WithLocalizationFunction({
		titleText = "Authentication.Login.Label.ConnectionError.Title",
		retryButtonText = RetryButtonText,
		bodyText = BodyText
	})(function(p2)
		-- upvalues: RoactModule (upval), InteractiveAlert (upval), Images (upval), ButtonType (upval), p1 (copy), GetFFlagDisableAuthFailureRetryModule (upval)
		return RoactModule.createElement(InteractiveAlert, {
			title = p2.titleText,
			bodyText = p2.bodyText,
			titleIcon = Images["icons/status/error_large"],
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							isDisabled = p1.state.countdownStarted or GetFFlagDisableAuthFailureRetryModule(),
							onActivated = p1.onRetry,
							text = string.gsub(p2.retryButtonText, "{.-}", p1.state.secondsRemaining or "")
						}
					}
				}
			},
			screenSize = p1.props.screenSize
		})
	end)
end

function AccountAuthenticationFailureOverlay.didMount(p1)
	p1.isMounted = true
end

function AccountAuthenticationFailureOverlay.willUnmount(p1)
	p1.isMounted = false
end

return (RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end)(AccountAuthenticationFailureOverlay))