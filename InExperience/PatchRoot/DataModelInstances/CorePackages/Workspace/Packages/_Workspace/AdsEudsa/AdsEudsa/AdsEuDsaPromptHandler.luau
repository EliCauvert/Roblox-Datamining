local AdService = game:GetService("AdService")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local ColorMode = require(Parent.Foundation).Enums.ColorMode
local UIBloxModule = require(Parent.UIBlox)
local AdsEuDsaPromptUIModule = require(script.Parent.AdsEuDsaPromptUI)
local RobloxTranslatorModule = require(Parent.RobloxTranslator)

local function getBodyText(AdvertiserName, PayerName) --[[ Line: 19 ]]
	-- upvalues: RobloxTranslatorModule (copy)
	return if AdvertiserName == "" or PayerName ~= "" then if AdvertiserName == "" or PayerName == "" then RobloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureStatic") else RobloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamicWithPayer", { AdvertiserName = AdvertiserName, PayerName = PayerName }) else RobloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamic", { AdvertiserName = AdvertiserName })
end

local AdsEuDsaPromptHandler = RoactModule.PureComponent:extend("AdsEuDsaPromptHandler")

function AdsEuDsaPromptHandler.init(p1) --[[ Line: 36 ]]
	-- upvalues: AdService (copy), getBodyText (copy)
	p1:setState({ enabled = false })
	p1.savedSelectedCoreObject = nil
	p1:setState({ bodyText = "" })
	AdService.ShowDynamicEudsaDisclosure:Connect(function(AdvertiserName, PayerName) --[[ Line: 46 ]]
		-- upvalues: p1 (copy), getBodyText (upval)
		p1:setState({ bodyText = getBodyText(AdvertiserName, PayerName) })
		p1:showPrompt()
	end)
end

function AdsEuDsaPromptHandler.saveSelectedObject(p1) --[[ Line: 54 ]]
	-- upvalues: GuiService (copy)
	p1.savedSelectedCoreObject = GuiService.SelectedCoreObject
	GuiService.SelectedCoreObject = nil
end

function AdsEuDsaPromptHandler.restoreSelectedObject(p1) --[[ Line: 59 ]]
	-- upvalues: CoreGui (copy), GuiService (copy)
	if p1.savedSelectedCoreObject == nil or p1.savedSelectedCoreObject:IsDescendantOf(CoreGui) then
		GuiService.SelectedCoreObject = p1.savedSelectedCoreObject
	end
end

function AdsEuDsaPromptHandler.showPrompt(p1) --[[ Line: 66 ]]
	p1:saveSelectedObject()
	p1:setState({ enabled = true })
end

function AdsEuDsaPromptHandler.hidePrompt(p1) --[[ Line: 73 ]]
	-- upvalues: AdService (copy)
	p1:setState({ enabled = false })
	AdService:HideEudsaDisclosure()
	p1:restoreSelectedObject()
end

function AdsEuDsaPromptHandler.render(Handler) --[[ Line: 81 ]]
	-- upvalues: UIBloxModule (copy), ColorMode (copy), RoactModule (copy), AdsEuDsaPromptUIModule (copy)
	return if Handler.state.enabled then RoactModule.createElement("ScreenGui", {
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = 15,
		AutoLocalize = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Enabled = Handler.state.enabled
	}, RoactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, {
		style = ({
			Dark = {
				themeName = ColorMode.Dark,
				fontName = UIBloxModule.App.Style.Constants.FontName.Gotham
			}
		}).Dark
	}, {
		Frame = RoactModule.createElement("Frame", {
			Selectable = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			Prompt = RoactModule.createElement(AdsEuDsaPromptUIModule, { handler = Handler, bodyText = Handler.state.bodyText }),
			ModalFix = RoactModule.createElement("ImageButton", {
				BackgroundTransparency = 0,
				Modal = true,
				Size = UDim2.new(0, 0, 0, 0)
			})
		})
	})) else nil
end

return AdsEuDsaPromptHandler