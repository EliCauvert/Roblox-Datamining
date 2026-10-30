local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.SduiCompat)
local Banner = require(Parent.Foundation).Banner

local function getThumbnail(p1)
	return if p1.thumbnailComponent then { type = "Slot", children = p1.thumbnailComponent } elseif p1.thumbnailIcon then { type = "Icon", icon = p1.thumbnailIcon } elseif p1.thumbnailImage then { type = "Image", image = p1.thumbnailImage } elseif p1.thumbnailUserId then {
		type = "Avatar",
		userId = p1.thumbnailUserId,
		userPresence = p1.thumbnailUserPresence
	} else nil
end

local function _(p1, OnClose)
	if OnClose then
		p1.onClose = OnClose
	end
	return p1
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), Banner (copy), getThumbnail (copy)
	if p1.size == "Small" then
		local CreateElementFunction = ReactModule.createElement
		local config = {
			size = "Small",
			density = p1.density,
			title = p1.title,
			description = p1.description,
			thumbnail = getThumbnail(p1),
			actions = if p1.primaryAction then { primary = { onActivated = p1.primaryAction } } else nil,
			LayoutOrder = p1.layoutOrder,
			AnchorPoint = p1.anchorPoint,
			Position = p1.position,
			Visible = p1.visible,
			ZIndex = p1.zIndex,
			testId = p1.testId
		}
		local OnClose = p1.onClose
		
		if OnClose then
			config.onClose = OnClose
		end
		return CreateElementFunction(Banner, config)
	else
		local CreateElementFunction1 = ReactModule.createElement
		local config1 = {
			size = p1.size,
			density = p1.density,
			title = p1.title,
			description = p1.description,
			media = if p1.media and p1.mediaWidth then { image = p1.media, width = p1.mediaWidth } else p1.media,
			actions = if p1.primaryAction or p1.secondaryActionText and p1.secondaryAction then {
				primary = if p1.primaryAction then { onActivated = p1.primaryAction } else nil,
				secondary = if p1.secondaryActionText and p1.secondaryAction then {
					text = p1.secondaryActionText,
					onActivated = p1.secondaryAction
				} else nil
			} else nil,
			LayoutOrder = p1.layoutOrder,
			AnchorPoint = p1.anchorPoint,
			Position = p1.position,
			Visible = p1.visible,
			ZIndex = p1.zIndex,
			testId = p1.testId
		}
		local OnClose1 = p1.onClose
		
		if OnClose1 then
			config1.onClose = OnClose1
		end
		return CreateElementFunction1(Banner, config1)
	end
end)