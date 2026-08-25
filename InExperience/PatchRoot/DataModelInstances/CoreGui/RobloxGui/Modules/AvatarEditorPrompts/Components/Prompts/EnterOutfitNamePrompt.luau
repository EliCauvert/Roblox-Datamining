local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local buttonType = require(corePackagesService.Packages.UIBlox).App.Button.Enum.ButtonType
local _ = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local promptWithTextFieldModule = require(parent.Prompts.PromptWithTextField)
local signalCreateOutfitPermissionDeniedModule = require(parent_1.Thunks.SignalCreateOutfitPermissionDenied)
local performCreateOutfitModule = require(parent_1.Thunks.PerformCreateOutfit)
local enterOutfitNamePrompt = roactModule.PureComponent:extend("EnterOutfitNamePrompt")
enterOutfitNamePrompt.validateProps = tModule.strictInterface({
	screenSize = tModule.Vector2,
	signalCreateOutfitPermissionDenied = tModule.callback,
	performCreateOutfit = tModule.callback
})

function enterOutfitNamePrompt.init(p0)
	-- upvalues: roactModule (ref)
	p0:setState({
		outfitName = "",
		alertPosition = UDim2.fromScale(0.5, 0.5)
	})
	p0.textBoxRef = roactModule.createRef()
	
	function p0.confirmCreateOutfit()
		-- upvalues: p0 (ref)
		p0.props.performCreateOutfit(p0.state.outfitName)
	end
	
	function p0.textUpdated(p1)
		-- upvalues: p0 (ref)
		p0:setState({ outfitName = p1 })
	end
end

function enterOutfitNamePrompt.render(p2)
	-- upvalues: roactModule (ref), promptWithTextFieldModule (ref), robloxTranslatorModule (ref), buttonType (ref)
	return roactModule.createElement(promptWithTextFieldModule, {
		fieldText = p2.state.outfitName,
		onFieldTextUpdated = p2.textUpdated,
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptTitle"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p2.props.signalCreateOutfitPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						isDisabled = p2.state.outfitName == "",
						onActivated = p2.confirmCreateOutfit,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptYes")
					}
				}
			}
		}
	})
end

return roactRoduxModule.connect(function(p3)
	return { screenSize = p3.screenSize }
end, function(p4)
	-- upvalues: signalCreateOutfitPermissionDeniedModule (ref), performCreateOutfitModule (ref)
	return {
		signalCreateOutfitPermissionDenied = function()
			-- upvalues: p4 (ref), signalCreateOutfitPermissionDeniedModule (copy)
			return p4(signalCreateOutfitPermissionDeniedModule)
		end,
		performCreateOutfit = function(p5)
			-- upvalues: p4 (ref), performCreateOutfitModule (copy)
			return p4(performCreateOutfitModule(p5))
		end
	}
end)(enterOutfitNamePrompt)