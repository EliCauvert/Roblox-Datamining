local Parent = script:FindFirstAncestor("PreHomePage").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local IXPServiceWrapper = require(Parent.IXPServiceWrapper).IXPServiceWrapper
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local Logger = require(Parent.Loggers).Logger
local PromiseModule = require(Parent.Promise)
local LaunchContext = require(Parent.AppStartup).Enums.LaunchContext
local FFlagTutorialUpsellEnabled = require(Parent.SharedFlags).FFlagTutorialUpsellEnabled
local TutorialUpsellOverrideIXPEnabled = game:DefineFastFlag("TutorialUpsellOverrideIXPEnabled", false)
local TutorialUpsellIXPLayerName = game:DefineFastString("TutorialUpsellIXPLayerName", "ConsumerPlatforms.TutorialUpsell.BTID")

local function _(p1): boolean
	-- upvalues: LaunchContext (copy)
	p1:flush()
	
	return p1:getState().LaunchContext == LaunchContext.SignUp
end

local function getTutorialUpsellIxpEligible()
	-- upvalues: TutorialUpsellOverrideIXPEnabled (copy), IXPServiceWrapper (copy), TutorialUpsellIXPLayerName (copy), Logger (copy)
	if TutorialUpsellOverrideIXPEnabled then
		return true
	end
	local Success, Result = pcall(function()
		-- upvalues: IXPServiceWrapper (upval), TutorialUpsellIXPLayerName (upval)
		return IXPServiceWrapper:GetBTIDLayerData(TutorialUpsellIXPLayerName)
	end)
	
	if not Success then
		Logger:error("Error fetching tutorial upsell IXP layer data")
		
		return false
	elseif Result then
		IXPServiceWrapper:LogBrowserTrackerLayerExposure(TutorialUpsellIXPLayerName)
		
		return Result.ShowTutorialUpsell or false
	else
		Logger:error("Tutorial upsell IXP layer data is nil")
		
		return false
	end
end

return function(_, p1, Callback)
	-- upvalues: FFlagTutorialUpsellEnabled (copy), Logger (copy), PromiseModule (copy), LaunchContext (copy), LinkingProtocol (copy), getTutorialUpsellIxpEligible (copy), AppPage (copy)
	if not FFlagTutorialUpsellEnabled then
		Logger:info("Tutorial upsell flag is not enabled")
		
		return PromiseModule.resolve(false)
	end
	p1:flush()
	
	if p1:getState().LaunchContext ~= LaunchContext.SignUp then
		Logger:info("User is not eligible for tutorial upsell")
		
		return PromiseModule.resolve(false)
	elseif LinkingProtocol:getLastLuaURL() ~= nil and LinkingProtocol:getLastLuaURL() ~= "" then
		Logger:info("Skipping tutorial upsell due to deep link")
		
		return PromiseModule.resolve(false)
	elseif getTutorialUpsellIxpEligible() then
		p1:dispatch(Callback({
			{
				name = AppPage.TutorialUpsellScreen,
				extraProps = { resetNavigationHistory = Callback }
			}
		}))
		
		return PromiseModule.resolve(true)
	else
		Logger:info("User is not eligible for tutorial upsell via IXP")
		
		return PromiseModule.resolve(false)
	end
end