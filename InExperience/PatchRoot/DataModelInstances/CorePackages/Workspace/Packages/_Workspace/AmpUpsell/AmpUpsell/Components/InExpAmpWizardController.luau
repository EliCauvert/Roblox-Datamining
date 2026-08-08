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
local var8 = if fFlagConnectionAmpUpsellOnLeave then require(parent.ApolloClient).ApolloProvider else nil
local var9 = nil

local function WizardScreenGui(p0) --[[ line: 36 ]]
	-- upvalues: useDispatch (ref), inExpAmpWizardDisplayOrder (ref), fFlagConnectionAmpUpsellOnLeave (ref), reactModule (ref), roactModule (ref), setScreenSize (ref), inExpWizardNavigatorModule (ref)
	local var12 = useDispatch()
	
	return reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ResetOnSpawn = false,
		DisplayOrder = if fFlagConnectionAmpUpsellOnLeave and p0 and p0.displayOrder then p0.displayOrder else inExpAmpWizardDisplayOrder,
		Enabled = true,
		OnTopOfCoreBlur = if fFlagConnectionAmpUpsellOnLeave and p0 and p0.onTopOfCoreBlur then true else nil,
		[roactModule.Change.AbsoluteSize] = function(p1) --[[ line: 53 ]]
			-- upvalues: var12 (ref), setScreenSize (copy)
			var12(setScreenSize(p1.AbsoluteSize))
		end
	}, {
		reactModule.createElement(inExpWizardNavigatorModule, { screenProps = { extraProps = p0 } })
	})
end

local function renderAmpWizard(p2, p3) --[[ line: 65 ]]
	-- upvalues: var9 (write), reactRobloxModule (ref), fFlagConnectionAmpUpsellOnLeave (ref), reactModule (ref), inExperienceProviderContainer (ref), WizardScreenGui (ref), var8 (write)
	if var9 == nil then
		local coreGuiService = game:GetService("CoreGui")
		local ampWizard = Instance.new("Folder")
		ampWizard.Name = "AmpWizard"
		ampWizard.Parent = coreGuiService
		var9 = reactRobloxModule.createRoot(ampWizard)
	end
	if not fFlagConnectionAmpUpsellOnLeave then
		var9:render(reactModule.createElement(inExperienceProviderContainer, {}, reactModule.createElement(WizardScreenGui, p2)))
		
		return
	end
	local var15 = reactModule.createElement(inExperienceProviderContainer, {}, reactModule.createElement(WizardScreenGui, p2))
	
	if p3 then
		var9:render(reactModule.createElement(var8, { client = p3 }, var15))
		
		return
	end
	var9:render(var15)
end

return {
	OpenAmpWizardContainerInExp = function(p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14) --[[ line: 92 ]]
		-- upvalues: getFFlagEnableDummyAMPWizardModule (ref), httpService (ref), getFFlagInExperienceContainerScreenSizeReducer (ref), getFFlagMoveAmpUpsellOffNavigateDown (ref), var9 (write), fFlagConnectionAmpUpsellOnLeave (ref), renderAmpWizard (ref)
		if getFFlagEnableDummyAMPWizardModule() then
			task.delay(0.5, function() --[[ line: 106 ]]
				-- upvalues: p5 (ref), httpService (copy)
				if p5 then
					local dummyAMPWizardAccessResponseFastString = game:GetFastString("DummyAMPWizardAccessResponse")
					local dummyAMPWizardActionsTakenJSONFastString = game:GetFastString("DummyAMPWizardActionsTakenJSON")
					local t = {}
					
					if pcall(function() --[[ line: 112 ]]
						-- upvalues: httpService (copy), dummyAMPWizardActionsTakenJSONFastString (ref)
						httpService:JSONDecode(dummyAMPWizardActionsTakenJSONFastString)
					end) then
						t = httpService:JSONDecode(dummyAMPWizardActionsTakenJSONFastString)
					else
						print("Failed to decode DummyWizardActionsTakenJSON, not calling completionCallback")
						
						return
					end
					p5(dummyAMPWizardAccessResponseFastString, t)
				end
			end)
			
			return
		elseif getFFlagInExperienceContainerScreenSizeReducer() and getFFlagMoveAmpUpsellOffNavigateDown() then
			renderAmpWizard({
				isInExperienceEntry = true,
				nameSpace = p9,
				featureName = p4,
				completionCallback = function(p15, p16) --[[ line: 129 ]]
					-- upvalues: var9 (copy), p5 (ref)
					if var9 then
						var9:render(nil)
					end
					if p5 then
						p5(p15, p16)
					end
				end,
				recourseData = p6,
				entryPointEventCtx = p7,
				extraParameters = p8,
				usePrologue = p13,
				prologueOptions = p14,
				displayOrder = if fFlagConnectionAmpUpsellOnLeave then p11 else nil,
				onTopOfCoreBlur = if fFlagConnectionAmpUpsellOnLeave then p12 else nil
			}, if fFlagConnectionAmpUpsellOnLeave then p10 else nil)
			
			return
		end
		print("InExpAmpWizardController: OpenAmpWizardContainerInExp called without necessary flags")
	end
}