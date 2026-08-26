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

function enterOutfitNamePrompt.init(p1)
	-- upvalues: roactModule (ref)
	p1:setState({
		outfitName = "",
		alertPosition = UDim2.fromScale(0.5, 0.5)
	})
	p1.textBoxRef = roactModule.createRef()
	
	function p0.confirmCreateOutfit()
		-- upvalues: p1 (ref)
		p1.props.performCreateOutfit(p1.state.outfitName)
	end
	
	function p0.textUpdated(p2)
		-- upvalues: p1 (ref)
		p1:setState({ outfitName = p2 })
	end
end

function enterOutfitNamePrompt.render(p1)
	-- upvalues: roactModule (ref), promptWithTextFieldModule (ref), robloxTranslatorModule (ref), buttonType (ref)
	return roactModule.createElement(promptWithTextFieldModule, {
		fieldText = p1.state.outfitName,
		onFieldTextUpdated = p1.textUpdated,
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptTitle"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalCreateOutfitPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						isDisabled = p1.state.outfitName == "",
						onActivated = p1.confirmCreateOutfit,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptYes")
					}
				}
			}
		}
	})
end

return roactRoduxModule.connect(function(p1)
	return { screenSize = p1.screenSize }
end, function(p1)
	-- upvalues: signalCreateOutfitPermissionDeniedModule (ref), performCreateOutfitModule (ref)
	return {
		signalCreateOutfitPermissionDenied = function()
			-- upvalues: p1 (ref), signalCreateOutfitPermissionDeniedModule (copy)
			return p1(signalCreateOutfitPermissionDeniedModule)
		end,
		performCreateOutfit = function(p2)
			-- upvalues: p1 (ref), performCreateOutfitModule (copy)
			return p1(performCreateOutfitModule(p2))
		end
	}
end)(enterOutfitNamePrompt)