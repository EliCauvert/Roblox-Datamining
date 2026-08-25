local adService = game:GetService("AdService")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local colorMode = require(parent.Foundation).Enums.ColorMode
local UIBloxModule = require(parent.UIBlox)
local adsEuDsaPromptUIModule = require(script.Parent.AdsEuDsaPromptUI)
local robloxTranslatorModule = require(parent.RobloxTranslator)

local function getBodyText(p0, p1)
	-- upvalues: robloxTranslatorModule (ref)
	return if not (p0 ~= "" and p1 == "") then if p0 == "" or p1 == "" then robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureStatic") else robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamicWithPayer", { AdvertiserName = p0, PayerName = p1 }) else robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamic", { AdvertiserName = p0 })
end

local adsEuDsaPromptHandler = roactModule.PureComponent:extend("AdsEuDsaPromptHandler")

function adsEuDsaPromptHandler.init(p2)
	-- upvalues: adService (ref), getBodyText (ref)
	p2:setState({ enabled = false })
	p2.savedSelectedCoreObject = nil
	p2:setState({ bodyText = "" })
	adService.ShowDynamicEudsaDisclosure:Connect(function(p3, p4)
		-- upvalues: p2 (ref), getBodyText (copy)
		p2:setState({ bodyText = getBodyText(p3, p4) })
		p2:showPrompt()
	end)
end

function adsEuDsaPromptHandler.saveSelectedObject(p5)
	-- upvalues: guiService (ref)
	p5.savedSelectedCoreObject = guiService.SelectedCoreObject
	guiService.SelectedCoreObject = nil
end

function adsEuDsaPromptHandler.restoreSelectedObject(p6)
	-- upvalues: coreGuiService (ref), guiService (ref)
	if p6.savedSelectedCoreObject == nil or p6.savedSelectedCoreObject:IsDescendantOf(coreGuiService) then
		guiService.SelectedCoreObject = p6.savedSelectedCoreObject
	end
end

function adsEuDsaPromptHandler.showPrompt(p7)
	p7:saveSelectedObject()
	p7:setState({ enabled = true })
end

function adsEuDsaPromptHandler.hidePrompt(p8)
	-- upvalues: adService (ref)
	p8:setState({ enabled = false })
	adService:HideEudsaDisclosure()
	p8:restoreSelectedObject()
end

function adsEuDsaPromptHandler.render(p9)
	-- upvalues: UIBloxModule (ref), colorMode (ref), roactModule (ref), adsEuDsaPromptUIModule (ref)
	return if p9.state.enabled then roactModule.createElement("ScreenGui", {
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = 15,
		AutoLocalize = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Enabled = p9.state.enabled
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
			Prompt = roactModule.createElement(adsEuDsaPromptUIModule, { handler = p9, bodyText = p9.state.bodyText }),
			ModalFix = roactModule.createElement("ImageButton", {
				BackgroundTransparency = 0,
				Modal = true,
				Size = UDim2.new(0, 0, 0, 0)
			})
		})
	})) else nil
end

return adsEuDsaPromptHandler