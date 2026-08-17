local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local playerVerifiedBadgeModule = require(parent.Components.Presentation.PlayerVerifiedBadge)
local fFlagPlayerListReskinVerifiedIconModule = require(parent.Flags.FFlagPlayerListReskinVerifiedIcon)
local fFlagPlayerListReskinContextMenuIconLayoutModule = require(parent.Flags.FFlagPlayerListReskinContextMenuIconLayout)

return reactModule.memo(function(p0) --[[ line: 15 | named "PlayerContextMenuHeader" ]]
	-- upvalues: reactModule (ref), text (ref), fFlagPlayerListReskinContextMenuIconLayoutModule (ref), fFlagPlayerListReskinVerifiedIconModule (ref), playerVerifiedBadgeModule (ref), view (ref), image (ref)
	local header = p0.header
	local t = {
		Username = reactModule.createElement(text, {
			LayoutOrder = 2,
			Text = header.username,
			tag = {
				["text-body-medium text-align-x-left content-default"] = true,
				["size-full-0 auto-y text-no-wrap text-truncate-end"] = fFlagPlayerListReskinContextMenuIconLayoutModule,
				["auto-xy"] = not fFlagPlayerListReskinContextMenuIconLayoutModule
			}
		})
	}
	
	if fFlagPlayerListReskinVerifiedIconModule then
		local t_1 = {
			DisplayNameText = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = header.displayName,
				tag = {
					["text-title-medium text-align-x-left content-emphasis"] = true,
					["fill auto-y text-no-wrap text-truncate-end"] = fFlagPlayerListReskinContextMenuIconLayoutModule,
					["auto-xy"] = not fFlagPlayerListReskinContextMenuIconLayoutModule
				}
			})
		}
		
		if p0.player ~= nil then
			t_1.VerifiedBadge = reactModule.createElement(playerVerifiedBadgeModule, { layoutOrder = 2, player = p0.player })
		end
		t.DisplayNameRow = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["row align-x-left align-y-center gap-xsmall"] = true,
				["size-full-0 auto-y"] = fFlagPlayerListReskinContextMenuIconLayoutModule,
				["auto-xy"] = not fFlagPlayerListReskinContextMenuIconLayoutModule
			}
		}, t_1)
	else
		t.DisplayName = reactModule.createElement(text, {
			LayoutOrder = 1,
			Text = header.displayName,
			tag = {
				["text-title-medium text-align-x-left content-emphasis"] = true,
				["size-full-0 auto-y text-no-wrap text-truncate-end"] = fFlagPlayerListReskinContextMenuIconLayoutModule,
				["auto-xy"] = not fFlagPlayerListReskinContextMenuIconLayoutModule
			}
		})
	end
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-1600 auto-y",
		LayoutOrder = p0.layoutOrder
	}, {
		Avatar = if fFlagPlayerListReskinContextMenuIconLayoutModule then reactModule.createElement(view, {
			tag = "size-1000-1000 radius-circle clip bg-shift-200",
			LayoutOrder = 1,
			testId = "player-context-menu-header-avatar"
		}, {
			Image = reactModule.createElement(image, {
				tag = "size-full radius-circle",
				Image = header.thumbnail or ""
			})
		}) else reactModule.createElement(image, {
			tag = "size-1000-1000 radius-circle",
			LayoutOrder = 1,
			testId = "player-context-menu-header-avatar",
			Image = header.thumbnail or ""
		}),
		NameColumn = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["col align-x-left"] = true,
				["fill auto-y"] = fFlagPlayerListReskinContextMenuIconLayoutModule,
				["auto-xy"] = not fFlagPlayerListReskinContextMenuIconLayoutModule
			}
		}, t)
	})
end)