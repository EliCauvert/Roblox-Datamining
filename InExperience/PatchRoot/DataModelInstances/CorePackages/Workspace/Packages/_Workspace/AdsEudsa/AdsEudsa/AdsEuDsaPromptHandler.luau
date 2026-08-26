local adService = game:GetService("AdService")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local colorMode = require(parent.Foundation).Enums.ColorMode
local UIBloxModule = require(parent.UIBlox)
local adsEuDsaPromptUIModule = require(script.Parent.AdsEuDsaPromptUI)
local robloxTranslatorModule = require(parent.RobloxTranslator)

local function getBodyText(p1, p2)
	-- upvalues: robloxTranslatorModule (ref)
	return if not (p1 ~= "" and p2 == "") then if p1 == "" or p2 == "" then robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureStatic") else robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamicWithPayer", { AdvertiserName = p1, PayerName = p2 }) else robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamic", { AdvertiserName = p1 })
end

local adsEuDsaPromptHandler = roactModule.PureComponent:extend("AdsEuDsaPromptHandler")

function adsEuDsaPromptHandler.init(p1)
	-- upvalues: adService (ref), getBodyText (ref)
	p1:setState({ enabled = false })
	p1.savedSelectedCoreObject = nil
	p1:setState({ bodyText = "" })
	adService.ShowDynamicEudsaDisclosure:Connect(function(p2, p3)
		-- upvalues: p1 (ref), getBodyText (copy)
		p1:setState({ bodyText = getBodyText(p2, p3) })
		p1:showPrompt()
	end)
end

function adsEuDsaPromptHandler.saveSelectedObject(p1)
	-- upvalues: guiService (ref)
	p1.savedSelectedCoreObject = guiService.SelectedCoreObject
	guiService.SelectedCoreObject = nil
end

function adsEuDsaPromptHandler.restoreSelectedObject(p1)
	-- upvalues: coreGuiService (ref), guiService (ref)
	if p1.savedSelectedCoreObject == nil or p1.savedSelectedCoreObject:IsDescendantOf(coreGuiService) then
		guiService.SelectedCoreObject = p1.savedSelectedCoreObject
	end
end

function adsEuDsaPromptHandler.showPrompt(p1)
	p1:saveSelectedObject()
	p1:setState({ enabled = true })
end

function adsEuDsaPromptHandler.hidePrompt(p1)
	-- upvalues: adService (ref)
	p1:setState({ enabled = false })
	adService:HideEudsaDisclosure()
	p1:restoreSelectedObject()
end

function adsEuDsaPromptHandler.render(p1)
	-- upvalues: UIBloxModule (ref), colorMode (ref), roactModule (ref), adsEuDsaPromptUIModule (ref)
	return if p1.state.enabled then roactModule.createElement("ScreenGui", {
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = 15,
		AutoLocalize = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Enabled = p1.state.enabled
	}, roactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, {
		style = ({
			Dark = {
				themeName = colorMode.Dark,
				fontName = UIBloxModule.App.Style.Constants.FontName.Gotham
			}
		}).Dark
	}, {
		Frame = roactModule.createElement("Frame", {
			Selectable = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			Prompt = roactModule.createElement(adsEuDsaPromptUIModule, { handler = p1, bodyText = p1.state.bodyText }),
			ModalFix = roactModule.createElement("ImageButton", {
				BackgroundTransparency = 0,
				Modal = true,
				Size = UDim2.new(0, 0, 0, 0)
			})
		})
	})) else nil
end

return adsEuDsaPromptHandler