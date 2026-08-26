local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local var1 = game:DefineFastFlag("AbuseReportingUseProfileFrameThumbnail", false) and require(parent.SharedFlags).GetFFlagProfileFrameThumbnailEnabled()
local avatar = foundationModule.Avatar
local image = foundationModule.Image
local text = foundationModule.Text
local view = foundationModule.View
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local useExperienceDetailsModule = require(genericAbuseReporting.BeduiV2.Hooks.Enrichment.useExperienceDetails)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)

local function UserPreview(p1)
	-- upvalues: reactModule (ref), view (ref), avatar (ref), var1 (ref), text (ref)
	local preview = p1.preview
	
	if not preview then
		return nil
	end
	local var2
	local createElement = reactModule.createElement
	local t = {
		tag = "row size-full-0 auto-y gap-medium radius-medium bg-surface-200 padding-medium align-y-center",
		LayoutOrder = p1.layoutOrder
	}
	local t_1 = {
		Avatar = preview.id ~= nil and reactModule.createElement(avatar, {
			LayoutOrder = 1,
			userId = tonumber(preview.id),
			includeProfileFrame = var1
		})
	}
	
	if not preview.displayName then
		var2 = preview.username and reactModule.createElement(view, { tag = "col auto-xy fill", LayoutOrder = 2 }, {
			DisplayName = preview.displayName and reactModule.createElement(text, {
				RichText = true,
				tag = "auto-xy content-emphasis text-wrap text-align-x-left",
				LayoutOrder = 1,
				Text = preview.displayName
			}),
			Username = preview.username and reactModule.createElement(text, {
				RichText = true,
				tag = "auto-xy text-wrap text-align-x-left",
				LayoutOrder = 2,
				Text = "@" .. preview.username
			})
		})
	end
	t_1.TextContainer = var2
	
	return createElement(view, t, t_1)
end

local function ChatPreview(p1)
	-- upvalues: reactModule (ref), view (ref), textWithTranslationModule (ref)
	local preview = p1.preview
	
	return if preview then reactModule.createElement(view, {
		tag = "size-full-0 auto-y gap-xsmall radius-medium bg-surface-200 padding-medium",
		LayoutOrder = p1.layoutOrder
	}, {
		Message = reactModule.createElement(textWithTranslationModule, {
			tag = "auto-xy text-wrap text-align-x-left",
			input = preview.text
		})
	}) else nil
end

local function ExperiencePreview(p1)
	-- upvalues: useExperienceDetailsModule (ref), reactModule (ref), view (ref), image (ref), text (ref)
	local preview = p1.preview
	local var2 = useExperienceDetailsModule(preview.id)
	
	return if preview then reactModule.createElement(view, {
		tag = "row size-full-0 auto-y gap-medium radius-medium bg-surface-200 padding-medium align-y-center",
		LayoutOrder = p1.layoutOrder
	}, {
		ExperienceIcon = reactModule.createElement(image, {
			tag = "radius-medium",
			Image = `rbxthumb://type=GameIcon&id={preview.id}&w=50&h=50`,
			Size = UDim2.fromOffset(40, 40)
		}),
		Name = reactModule.createElement(text, {
			RichText = true,
			tag = "auto-xy text-wrap text-align-x-left",
			Text = if var2 then var2.name else preview.title or ""
		})
	}) else nil
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), UserPreview (ref), ChatPreview (ref), ExperiencePreview (ref)
	local preview = p1.preview
	
	return if preview.type == "user" then reactModule.createElement(UserPreview, { preview = preview, layoutOrder = p1.layoutOrder }) elseif preview.type == "chat" then reactModule.createElement(ChatPreview, { preview = preview, layoutOrder = p1.layoutOrder }) elseif preview.type == "experience" then reactModule.createElement(ExperiencePreview, { preview = preview, layoutOrder = p1.layoutOrder }) else nil
end)