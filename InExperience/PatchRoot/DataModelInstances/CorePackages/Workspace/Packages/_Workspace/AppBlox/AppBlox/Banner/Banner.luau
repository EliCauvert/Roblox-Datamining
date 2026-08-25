local parent = script:FindFirstAncestor("AppBlox").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local bannerBadgeModule = require(script.Parent.BannerBadge)
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local t = {
	isContained = true,
	width = UDim.new(1, 0),
	tags = { container = "col auto-y" }
}

return reactModule.memo(function(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), button (ref), foundationModule (ref), bannerBadgeModule (ref), iconButton (ref), view (ref), icon (ref), image (ref), text (ref)
	local var5 = cryoModule.Dictionary.join(t, p0)
	local var6 = "col auto-y"
	
	if var5.isContained then
		var6 ..= " " .. "radius-medium padding-large stroke-standard stroke-default bg-shift-100"
	end
	local var7 = var5.badges and #var5.badges > 0
	local var8 = var5.buttons and (#var5.buttons < 2 and (not var5.image and (not var5.body and (not var7 and not var5.onDismiss))))
	local var9 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), reactModule (copy), iconButton (copy), var7 (ref), foundationModule (copy)
		return if var5.onDismiss then reactModule.createElement(iconButton, {
			isCircular = true,
			testId = if var7 then "--banner-badges-dismiss" else "--banner-dismiss",
			LayoutOrder = if var7 then 1 else 3,
			icon = foundationModule.Enums.IconName.XSmall,
			variant = foundationModule.Enums.ButtonVariant.Utility,
			onActivated = var5.onDismiss
		}) else nil
	end, { var5.onDismiss, var7 })
	
	return reactModule.createElement(view, {
		testId = "--banner",
		LayoutOrder = var5.LayoutOrder,
		Size = UDim2.new(var5.width.Scale, var5.width.Offset, 0, 0),
		tag = var6
	}, {
		BadgesRow = if var7 then reactModule.createElement(view, {
			tag = "row auto-y size-full-0 flex-between gap-large align-y-center padding-bottom-large",
			LayoutOrder = 2
		}, {
			Badges = reactModule.createElement(view, {
				LayoutOrder = 1,
				testId = "--banner-badges",
				tag = "row auto-xy gap-small fill"
			}, reactModule.useMemo(function()
				-- upvalues: var5 (ref), reactModule (copy), bannerBadgeModule (copy), cryoModule (copy)
				local t = {}
				
				if var5.badges then
					for i, v in ipairs(var5.badges) do
						t["banner-badge-" .. i] = reactModule.createElement(bannerBadgeModule, cryoModule.Dictionary.join({ testId = "--banner-badge-" .. i, LayoutOrder = i + 1 }, v))
					end
				end
				return t
			end, { var5.badges })),
			Dismiss = if var9 then reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 2 }, { Dismiss = var9 }) else nil
		}) else nil,
		ContentRow = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = {
				["row auto-y size-full-0 gap-large"] = true,
				["align-y-center"] = var8
			}
		}, {
			Icon = if var5.icon and not var5.image then reactModule.createElement(icon, {
				testId = "--banner-icon",
				LayoutOrder = 1,
				size = foundationModule.Enums.IconSize.Large,
				name = var5.icon,
				variant = var5.iconVariant,
				style = var5.iconStyle
			}) else nil,
			Image = if var5.image then reactModule.createElement(view, { tag = "auto-xy flex-none bg-shift-100 radius-medium" }, {
				Image = reactModule.createElement(image, {
					testId = "--banner-image",
					tag = "size-1800",
					Image = var5.image,
					ScaleType = Enum.ScaleType.Fit
				})
			}) else nil,
			Content = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = {
					["auto-xy gap-small align-x-left fill"] = true,
					["col flex-fill"] = not var8,
					["row align-y-center flex-between"] = var8
				}
			}, {
				Title = reactModule.createElement(text, {
					testId = "--banner-title",
					tag = "auto-xy text-title-medium content-emphasis fill text-wrap text-align-x-left",
					LayoutOrder = 1,
					Text = var5.title
				}),
				InlineButton = if var8 and var5.buttons and var5.buttons[1] then reactModule.createElement(button, cryoModule.Dictionary.join({
					tag = "auto-xy shrink",
					LayoutOrder = 2,
					testId = "--banner-button-inline"
				}, var5.buttons[1])) else nil,
				Subcontent = if not var8 then reactModule.createElement(view, { tag = "auto-xy col gap-large shrink", LayoutOrder = 2 }, {
					Body = if var5.body then reactModule.createElement(text, {
						testId = "--banner-body",
						tag = "auto-xy text-body-medium content-default text-wrap text-align-x-left",
						LayoutOrder = 1,
						RichText = true,
						Text = var5.body
					}) else nil,
					Buttons = reactModule.createElement(view, {
						tag = "row auto-xy grow gap-small wrap",
						LayoutOrder = 2,
						testId = "--banner-buttons"
					}, reactModule.useMemo(function()
						-- upvalues: var5 (ref), reactModule (copy), button (copy), cryoModule (copy), foundationModule (copy)
						local t = {}
						
						if var5.buttons and #var5.buttons > 0 then
							for i, v in var5.buttons do
								t["banner-button-" .. i] = reactModule.createElement(button, cryoModule.Dictionary.join({
									LayoutOrder = i + 1,
									size = foundationModule.Enums.InputSize.Small,
									testId = "--banner-button-" .. i
								}, v))
							end
						end
						return t
					end, { var5.buttons }))
				}) else nil
			}),
			Dismiss = if not var7 then var9 else nil
		})
	})
end)