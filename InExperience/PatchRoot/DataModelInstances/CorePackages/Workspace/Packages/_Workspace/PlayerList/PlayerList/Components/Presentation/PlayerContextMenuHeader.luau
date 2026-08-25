local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local playerVerifiedBadgeModule = require(parent.Components.Presentation.PlayerVerifiedBadge)
local constantsModule = require(parent.Common.Constants)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), text (ref), playerVerifiedBadgeModule (ref), view (ref), constantsModule (ref), image (ref)
	local header = p0.header
	local t = {
		DisplayNameText = reactModule.createElement(text, {
			tag = "shrink auto-xy text-title-medium text-wrap text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 1,
			Text = header.displayName
		})
	}
	
	if p0.player ~= nil then
		t.VerifiedBadge = reactModule.createElement(playerVerifiedBadgeModule, { layoutOrder = 2, player = p0.player })
	end
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-1600 auto-y",
		LayoutOrder = p0.layoutOrder,
		selection = constantsModule.NOT_SELECTABLE
	}, {
		Avatar = reactModule.createElement(view, {
			tag = "size-1000-1000 radius-circle clip bg-shift-200",
			LayoutOrder = 1,
			testId = "player-context-menu-header-avatar"
		}, {
			Image = reactModule.createElement(image, {
				tag = "size-full radius-circle",
				Image = header.thumbnail or ""
			})
		}),
		NameColumn = reactModule.createElement(view, { LayoutOrder = 2, tag = "col align-x-left fill auto-y" }, {
			DisplayNameRow = reactModule.createElement(view, {
				tag = "row align-x-left align-y-center gap-xsmall size-full-0 auto-y",
				LayoutOrder = 1
			}, t),
			Username = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-default",
				LayoutOrder = 2,
				Text = header.username
			})
		})
	})
end)