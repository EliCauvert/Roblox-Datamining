local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local playerVerifiedBadgeModule = require(parent.Components.Presentation.PlayerVerifiedBadge)
local fFlagPlayerListReskinVerifiedIconModule = require(parent.Flags.FFlagPlayerListReskinVerifiedIcon)

return reactModule.memo(function(p0) --[[ line: 14 | named "PlayerContextMenuHeader" ]]
	-- upvalues: reactModule (ref), text (ref), fFlagPlayerListReskinVerifiedIconModule (ref), playerVerifiedBadgeModule (ref), view (ref), image (ref)
	local header = p0.header
	local t = {
		Username = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium text-align-x-left content-default",
			LayoutOrder = 2,
			Text = header.username
		})
	}
	
	if fFlagPlayerListReskinVerifiedIconModule then
		local t_1 = {
			DisplayNameText = reactModule.createElement(text, {
				tag = "auto-xy text-title-medium text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = header.displayName
			})
		}
		
		if p0.player ~= nil then
			t_1.VerifiedBadge = reactModule.createElement(playerVerifiedBadgeModule, { layoutOrder = 2, player = p0.player })
		end
		t.DisplayNameRow = reactModule.createElement(view, {
			tag = "row align-x-left align-y-center gap-xsmall auto-xy",
			LayoutOrder = 1
		}, t_1)
	else
		t.DisplayName = reactModule.createElement(text, {
			tag = "auto-xy text-title-medium text-align-x-left content-emphasis",
			LayoutOrder = 1,
			Text = header.displayName
		})
	end
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-1600 auto-y",
		LayoutOrder = p0.layoutOrder
	}, {
		Avatar = reactModule.createElement(image, {
			tag = "size-1000-1000 radius-circle",
			LayoutOrder = 1,
			Image = header.thumbnail or ""
		}),
		NameColumn = reactModule.createElement(view, { LayoutOrder = 2, tag = "col align-x-left auto-xy" }, t)
	})
end)