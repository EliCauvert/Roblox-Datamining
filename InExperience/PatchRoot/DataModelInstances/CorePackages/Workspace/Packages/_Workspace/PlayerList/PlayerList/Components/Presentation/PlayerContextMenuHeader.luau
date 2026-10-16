local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local PlayerVerifiedBadgeModule = require(Parent.Components.Presentation.PlayerVerifiedBadge)
local ConstantsModule = require(Parent.Common.Constants)

return ReactModule.memo(function(p1) --[[ Line: 14 | Named "PlayerContextMenuHeader" ]]
	-- upvalues: ReactModule (copy), Text (copy), PlayerVerifiedBadgeModule (copy), View (copy), ConstantsModule (copy), Image (copy)
	local Header = p1.header
	local config = {
		DisplayNameText = ReactModule.createElement(Text, {
			tag = "shrink auto-xy text-title-medium text-wrap text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 1,
			Text = Header.displayName
		})
	}
	
	if p1.player ~= nil then
		config.VerifiedBadge = ReactModule.createElement(PlayerVerifiedBadgeModule, { layoutOrder = 2, player = p1.player })
	end
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-medium size-full-1600 auto-y",
		LayoutOrder = p1.layoutOrder,
		selection = ConstantsModule.NOT_SELECTABLE
	}, {
		Avatar = ReactModule.createElement(View, {
			tag = "size-1000-1000 radius-circle clip bg-shift-200",
			LayoutOrder = 1,
			testId = "player-context-menu-header-avatar"
		}, {
			Image = ReactModule.createElement(Image, {
				tag = "size-full radius-circle",
				Image = Header.thumbnail or ""
			})
		}),
		NameColumn = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col align-x-left fill auto-y" }, {
			DisplayNameRow = ReactModule.createElement(View, {
				tag = "row align-x-left align-y-center gap-xsmall size-full-0 auto-y",
				LayoutOrder = 1
			}, config),
			Username = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-default",
				LayoutOrder = 2,
				Text = Header.username
			})
		})
	})
end)