local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagProfileFrameThumbnailEnabled = game:DefineFastFlag("AbuseReportingUseProfileFrameThumbnail", false) and require(Parent.SharedFlags).GetFFlagProfileFrameThumbnailEnabled()
local Avatar = FoundationModule.Avatar
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local UseExperienceDetailsModule = require(GenericAbuseReporting.BeduiV2.Hooks.Enrichment.useExperienceDetails)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)

local function UserPreview(p1)
	-- upvalues: ReactModule (copy), View (copy), Avatar (copy), FFlagProfileFrameThumbnailEnabled (copy), Text (copy)
	local Preview = p1.preview
	
	return if Preview then ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-medium radius-medium bg-surface-200",
		LayoutOrder = p1.layoutOrder
	}, {
		Avatar = Preview.id ~= nil and ReactModule.createElement(Avatar, {
			LayoutOrder = 1,
			userId = tonumber(Preview.id),
			includeProfileFrame = FFlagProfileFrameThumbnailEnabled
		}),
		TextContainer = if Preview.displayName then ReactModule.createElement(View, { tag = "col fill auto-xy", LayoutOrder = 2 }, {
			DisplayName = Preview.displayName and ReactModule.createElement(Text, {
				RichText = true,
				tag = "auto-xy text-wrap text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = Preview.displayName
			}),
			Username = Preview.username and ReactModule.createElement(Text, {
				RichText = true,
				tag = "auto-xy text-wrap text-align-x-left",
				LayoutOrder = 2,
				Text = "@" .. Preview.username
			})
		}) else Preview.username and ReactModule.createElement(View, { tag = "col fill auto-xy", LayoutOrder = 2 }, {
			DisplayName = Preview.displayName and ReactModule.createElement(Text, {
				RichText = true,
				tag = "auto-xy text-wrap text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = Preview.displayName
			}),
			Username = Preview.username and ReactModule.createElement(Text, {
				RichText = true,
				tag = "auto-xy text-wrap text-align-x-left",
				LayoutOrder = 2,
				Text = "@" .. Preview.username
			})
		})
	}) else nil
end

local function ChatPreview(p1)
	-- upvalues: ReactModule (copy), View (copy), TextWithTranslationModule (copy)
	local Preview = p1.preview
	
	return if Preview then ReactModule.createElement(View, {
		tag = "gap-xsmall size-full-0 auto-y padding-medium radius-medium bg-surface-200",
		LayoutOrder = p1.layoutOrder
	}, {
		Message = ReactModule.createElement(TextWithTranslationModule, {
			tag = "auto-xy text-wrap text-align-x-left",
			input = Preview.text
		})
	}) else nil
end

local function ExperiencePreview(p1)
	-- upvalues: UseExperienceDetailsModule (copy), ReactModule (copy), View (copy), Image (copy), Text (copy)
	local Preview = p1.preview
	local UseExperienceDetailsModuleResult = UseExperienceDetailsModule(Preview.id)
	
	return if Preview then ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-medium radius-medium bg-surface-200",
		LayoutOrder = p1.layoutOrder
	}, {
		ExperienceIcon = ReactModule.createElement(Image, {
			tag = "radius-medium",
			Image = `rbxthumb://type=GameIcon&id={Preview.id}&w=50&h=50`,
			Size = UDim2.fromOffset(40, 40)
		}),
		Name = ReactModule.createElement(Text, {
			RichText = true,
			tag = "auto-xy text-wrap text-align-x-left",
			Text = UseExperienceDetailsModuleResult and UseExperienceDetailsModuleResult.name or (Preview.title or "")
		})
	}) else nil
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UserPreview (copy), ChatPreview (copy), ExperiencePreview (copy)
	local Preview = p1.preview
	
	return if Preview.type == "user" then ReactModule.createElement(UserPreview, { preview = Preview, layoutOrder = p1.layoutOrder }) elseif Preview.type == "chat" then ReactModule.createElement(ChatPreview, { preview = Preview, layoutOrder = p1.layoutOrder }) elseif Preview.type == "experience" then ReactModule.createElement(ExperiencePreview, { preview = Preview, layoutOrder = p1.layoutOrder }) else nil
end)