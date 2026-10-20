local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoactModule = require(Parent.Roact)
local SetScreenSizeFunction = require(Parent.InExperienceContainer).SetScreenSize
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local _ = require(AmpUpsell.Common.Types)
local AppAmpWizardLaunchBridgeModule = require(AmpUpsell.Common.AppAmpWizardLaunchBridge)
local _ = require(AmpUpsell.Components.WizardContainer)
local InExpWizardNavigatorModule = require(AmpUpsell.Components.InExpWizardNavigator)
local InExperienceProviderContainer = require(Parent.InExperienceContainer).InExperienceProviderContainer
game:DefineFastString("DummyAMPWizardAccessResponse", "Granted")
game:DefineFastString("DummyAMPWizardActionsTakenJSON", "{}")
local GetFFlagEnableDummyAMPWizardModule = require(AmpUpsell.Flags.GetFFlagEnableDummyAMPWizard)
local GetFFlagInExperienceContainerScreenSizeReducerFunction = require(Parent.SharedFlags).GetFFlagInExperienceContainerScreenSizeReducer
local GetFFlagMoveAmpUpsellOffNavigateDownFunction = require(Parent.SharedFlags).GetFFlagMoveAmpUpsellOffNavigateDown
local InExpAmpWizardDisplayOrder = game:DefineFastInt("InExpAmpWizardDisplayOrder", 6)
local FFlagRouteStandaloneAmpThroughUniversalApp = require(Parent.SharedFlags).FFlagRouteStandaloneAmpThroughUniversalApp
local ApolloProvider = require(Parent.ApolloClient).ApolloProvider
local Root = nil

local function WizardScreenGui(ExtraProps)
	-- upvalues: UseDispatchFunction (copy), InExpAmpWizardDisplayOrder (copy), ReactModule (copy), RoactModule (copy), SetScreenSizeFunction (copy), InExpWizardNavigatorModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ResetOnSpawn = false,
		DisplayOrder = if ExtraProps and ExtraProps.displayOrder then ExtraProps.displayOrder else InExpAmpWizardDisplayOrder,
		Enabled = true,
		OnTopOfCoreBlur = if ExtraProps and ExtraProps.onTopOfCoreBlur then true else nil,
		[RoactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UseDispatchResult (copy), SetScreenSizeFunction (upval)
			UseDispatchResult(SetScreenSizeFunction(Frame.AbsoluteSize))
		end
	}, {
		ReactModule.createElement(InExpWizardNavigatorModule, { screenProps = { extraProps = ExtraProps } })
	})
end

local function renderAmpWizard(p1, Client)
	-- upvalues: Root (ref), ReactRobloxModule (copy), ReactModule (copy), InExperienceProviderContainer (copy), WizardScreenGui (copy), ApolloProvider (copy)
	if Root == nil then
		local AmpWizard = Instance.new("Folder")
		AmpWizard.Name = "AmpWizard"
		AmpWizard.Parent = game:GetService("CoreGui")
		Root = ReactRobloxModule.createRoot(AmpWizard)
	end
	local Element = ReactModule.createElement(InExperienceProviderContainer, {}, ReactModule.createElement(WizardScreenGui, p1))
	
	if Client then
		Root:render(ReactModule.createElement(ApolloProvider, { client = Client }, Element))
		
		return
	else
		Root:render(Element)
	end
end

return {
	OpenAmpWizardContainerInExp = function(FeatureName, Callback, RecourseData, EntryPointEventCtx, ExtraParameters, NameSpace, Client, DisplayOrder, OnTopOfCoreBlur, UsePrologue, PrologueOptions)
		-- upvalues: GetFFlagEnableDummyAMPWizardModule (copy), HttpService (copy), FFlagRouteStandaloneAmpThroughUniversalApp (copy), AppAmpWizardLaunchBridgeModule (copy), GetFFlagInExperienceContainerScreenSizeReducerFunction (copy), GetFFlagMoveAmpUpsellOffNavigateDownFunction (copy), Root (ref), renderAmpWizard (copy)
		if GetFFlagEnableDummyAMPWizardModule() then
			task.delay(0.5, function()
				-- upvalues: Callback (copy), HttpService (upval)
				if Callback then
					local DummyAMPWizardAccessResponseFastString = game:GetFastString("DummyAMPWizardAccessResponse")
					local DummyAMPWizardActionsTakenJSONFastString = game:GetFastString("DummyAMPWizardActionsTakenJSON")
					local t = {}
					
					if not pcall(function()
						-- upvalues: HttpService (upval), DummyAMPWizardActionsTakenJSONFastString (copy)
						HttpService:JSONDecode(DummyAMPWizardActionsTakenJSONFastString)
					end) then
						print("Failed to decode DummyWizardActionsTakenJSON, not calling completionCallback")
						
						return
					end
					t = HttpService:JSONDecode(DummyAMPWizardActionsTakenJSONFastString)
					Callback(DummyAMPWizardAccessResponseFastString, t)
				end
			end)
			
			return
		end
		if FFlagRouteStandaloneAmpThroughUniversalApp and AppAmpWizardLaunchBridgeModule.requestOpen({
			featureName = FeatureName,
			nameSpace = NameSpace,
			recourseData = RecourseData,
			entryPointEventCtx = EntryPointEventCtx,
			extraParameters = ExtraParameters,
			usePrologue = UsePrologue,
			prologueOptions = PrologueOptions,
			completionCallback = Callback
		}) then return end
		if GetFFlagInExperienceContainerScreenSizeReducerFunction() and GetFFlagMoveAmpUpsellOffNavigateDownFunction() then
			renderAmpWizard({
				isInExperienceEntry = true,
				nameSpace = NameSpace,
				featureName = FeatureName,
				completionCallback = function(p1, p2)
					-- upvalues: Root (upval), Callback (copy)
					if Root then
						Root:render(nil)
					end
					if Callback then
						Callback(p1, p2)
					end
				end,
				recourseData = RecourseData,
				entryPointEventCtx = EntryPointEventCtx,
				extraParameters = ExtraParameters,
				usePrologue = UsePrologue,
				prologueOptions = PrologueOptions,
				displayOrder = DisplayOrder,
				onTopOfCoreBlur = OnTopOfCoreBlur
			}, Client)
			
			return
		else
			print("InExpAmpWizardController: OpenAmpWizardContainerInExp called without necessary flags")
		end
	end
}