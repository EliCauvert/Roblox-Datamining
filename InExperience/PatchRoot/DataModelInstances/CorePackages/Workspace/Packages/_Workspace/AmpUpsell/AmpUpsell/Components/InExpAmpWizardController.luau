local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local roactModule = require(parent.Roact)
local setScreenSize = require(parent.InExperienceContainer).SetScreenSize
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local _ = require(ampUpsell.Common.Types)
local _ = require(ampUpsell.Components.WizardContainer)
local inExpWizardNavigatorModule = require(ampUpsell.Components.InExpWizardNavigator)
local inExperienceProviderContainer = require(parent.InExperienceContainer).InExperienceProviderContainer
game:DefineFastString("DummyAMPWizardAccessResponse", "Granted")
game:DefineFastString("DummyAMPWizardActionsTakenJSON", "{}")
local getFFlagEnableDummyAMPWizardModule = require(ampUpsell.Flags.GetFFlagEnableDummyAMPWizard)
local getFFlagInExperienceContainerScreenSizeReducer = require(parent.SharedFlags).GetFFlagInExperienceContainerScreenSizeReducer
local getFFlagMoveAmpUpsellOffNavigateDown = require(parent.SharedFlags).GetFFlagMoveAmpUpsellOffNavigateDown
local fFlagConnectionAmpUpsellOnLeave = require(parent.SharedFlags).FFlagConnectionAmpUpsellOnLeave
local inExpAmpWizardDisplayOrder = game:DefineFastInt("InExpAmpWizardDisplayOrder", 6)
local var1 = if fFlagConnectionAmpUpsellOnLeave then require(parent.ApolloClient).ApolloProvider else nil
local var2 = nil

local function WizardScreenGui(p1)
	-- upvalues: useDispatch (ref), inExpAmpWizardDisplayOrder (ref), fFlagConnectionAmpUpsellOnLeave (ref), reactModule (ref), roactModule (ref), setScreenSize (ref), inExpWizardNavigatorModule (ref)
	local var3 = useDispatch()
	
	return reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ResetOnSpawn = false,
		DisplayOrder = if fFlagConnectionAmpUpsellOnLeave and p1 and p1.displayOrder then p1.displayOrder else inExpAmpWizardDisplayOrder,
		Enabled = true,
		OnTopOfCoreBlur = if fFlagConnectionAmpUpsellOnLeave and p1 and p1.onTopOfCoreBlur then true else nil,
		[roactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var3 (ref), setScreenSize (copy)
			var3(setScreenSize(p2.AbsoluteSize))
		end
	}, {
		reactModule.createElement(inExpWizardNavigatorModule, { screenProps = { extraProps = p1 } })
	})
end

local function renderAmpWizard(p1, p2)
	-- upvalues: var2 (write), reactRobloxModule (ref), fFlagConnectionAmpUpsellOnLeave (ref), reactModule (ref), inExperienceProviderContainer (ref), WizardScreenGui (ref), var1 (write)
	if var2 == nil then
		local coreGuiService = game:GetService("CoreGui")
		local ampWizard = Instance.new("Folder")
		ampWizard.Name = "AmpWizard"
		ampWizard.Parent = coreGuiService
		var2 = reactRobloxModule.createRoot(ampWizard)
	end
	if not fFlagConnectionAmpUpsellOnLeave then
		var2:render(reactModule.createElement(inExperienceProviderContainer, {}, reactModule.createElement(WizardScreenGui, p1)))
		
		return
	end
	local var3 = reactModule.createElement(inExperienceProviderContainer, {}, reactModule.createElement(WizardScreenGui, p1))
	
	if p2 then
		var2:render(reactModule.createElement(var1, { client = p2 }, var3))
		
		return
	end
	var2:render(var3)
end

return {
	OpenAmpWizardContainerInExp = function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
		-- upvalues: getFFlagEnableDummyAMPWizardModule (ref), httpService (ref), getFFlagInExperienceContainerScreenSizeReducer (ref), getFFlagMoveAmpUpsellOffNavigateDown (ref), var2 (write), fFlagConnectionAmpUpsellOnLeave (ref), renderAmpWizard (ref)
		if getFFlagEnableDummyAMPWizardModule() then
			task.delay(0.5, function()
				-- upvalues: p2 (ref), httpService (copy)
				if p2 then
					local dummyAMPWizardAccessResponseFastString = game:GetFastString("DummyAMPWizardAccessResponse")
					local dummyAMPWizardActionsTakenJSONFastString = game:GetFastString("DummyAMPWizardActionsTakenJSON")
					local t = {}
					
					if pcall(function()
						-- upvalues: httpService (copy), dummyAMPWizardActionsTakenJSONFastString (ref)
						httpService:JSONDecode(dummyAMPWizardActionsTakenJSONFastString)
					end) then
						t = httpService:JSONDecode(dummyAMPWizardActionsTakenJSONFastString)
					else
						print("Failed to decode DummyWizardActionsTakenJSON, not calling completionCallback")
						
						return
					end
					p2(dummyAMPWizardAccessResponseFastString, t)
				end
			end)
			
			return
		elseif getFFlagInExperienceContainerScreenSizeReducer() and getFFlagMoveAmpUpsellOffNavigateDown() then
			renderAmpWizard({
				isInExperienceEntry = true,
				nameSpace = p6,
				featureName = p1,
				completionCallback = function(p12, p13)
					-- upvalues: var2 (copy), p2 (ref)
					if var2 then
						var2:render(nil)
					end
					if p2 then
						p2(p12, p13)
					end
				end,
				recourseData = p3,
				entryPointEventCtx = p4,
				extraParameters = p5,
				usePrologue = p10,
				prologueOptions = p11,
				displayOrder = if fFlagConnectionAmpUpsellOnLeave then p8 else nil,
				onTopOfCoreBlur = if fFlagConnectionAmpUpsellOnLeave then p9 else nil
			}, if fFlagConnectionAmpUpsellOnLeave then p7 else nil)
			
			return
		end
		print("InExpAmpWizardController: OpenAmpWizardContainerInExp called without necessary flags")
	end
}