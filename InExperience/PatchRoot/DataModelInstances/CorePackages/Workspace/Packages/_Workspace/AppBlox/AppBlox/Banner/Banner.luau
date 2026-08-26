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

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), button (ref), foundationModule (ref), bannerBadgeModule (ref), iconButton (ref), view (ref), icon (ref), image (ref), text (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = "col auto-y"
	
	if var1.isContained then
		var2 ..= " " .. "radius-medium padding-large stroke-standard stroke-default bg-shift-100"
	end
	local var3 = var1.badges and #var1.badges > 0
	local var4 = var1.buttons and (#var1.buttons < 2 and (not var1.image and (not var1.body and (not var3 and not var1.onDismiss))))
	local var5 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), reactModule (copy), iconButton (copy), var3 (ref), foundationModule (copy)
		return if var1.onDismiss then reactModule.createElement(iconButton, {
			isCircular = true,
			testId = if var3 then "--banner-badges-dismiss" else "--banner-dismiss",
			LayoutOrder = if var3 then 1 else 3,
			icon = foundationModule.Enums.IconName.XSmall,
			variant = foundationModule.Enums.ButtonVariant.Utility,
			onActivated = var1.onDismiss
		}) else nil
	end, { var1.onDismiss, var3 })
	
	return reactModule.createElement(view, {
		testId = "--banner",
		LayoutOrder = var1.LayoutOrder,
		Size = UDim2.new(var1.width.Scale, var1.width.Offset, 0, 0),
		tag = var2
	}, {
		BadgesRow = if var3 then reactModule.createElement(view, {
			tag = "row auto-y size-full-0 flex-between gap-large align-y-center padding-bottom-large",
			LayoutOrder = 2
		}, {
			Badges = reactModule.createElement(view, {
				LayoutOrder = 1,
				testId = "--banner-badges",
				tag = "row auto-xy gap-small fill"
			}, reactModule.useMemo(function()
				-- upvalues: var1 (ref), reactModule (copy), bannerBadgeModule (copy), cryoModule (copy)
				local t = {}
				
				if var1.badges then
					for i, v in ipairs(var1.badges) do
						t["banner-badge-" .. i] = reactModule.createElement(bannerBadgeModule, cryoModule.Dictionary.join({ testId = "--banner-badge-" .. i, LayoutOrder = i + 1 }, v))
					end
				end
				return t
			end, { var1.badges })),
			Dismiss = if var5 then reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 2 }, { Dismiss = var5 }) else nil
		}) else nil,
		ContentRow = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = {
				["row auto-y size-full-0 gap-large"] = true,
				["align-y-center"] = var4
			}
		}, {
			Icon = if var1.icon and not var1.image then reactModule.createElement(icon, {
				testId = "--banner-icon",
				LayoutOrder = 1,
				size = foundationModule.Enums.IconSize.Large,
				name = var1.icon,
				variant = var1.iconVariant,
				style = var1.iconStyle
			}) else nil,
			Image = if var1.image then reactModule.createElement(view, { tag = "auto-xy flex-none bg-shift-100 radius-medium" }, {
				Image = reactModule.createElement(image, {
					testId = "--banner-image",
					tag = "size-1800",
					Image = var1.image,
					ScaleType = Enum.ScaleType.Fit
				})
			}) else nil,
			Content = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = {
					["auto-xy gap-small align-x-left fill"] = true,
					["col flex-fill"] = not var4,
					["row align-y-center flex-between"] = var4
				}
			}, {
				Title = reactModule.createElement(text, {
					testId = "--banner-title",
					tag = "auto-xy text-title-medium content-emphasis fill text-wrap text-align-x-left",
					LayoutOrder = 1,
					Text = var1.title
				}),
				InlineButton = if var4 and var1.buttons and var1.buttons[1] then reactModule.createElement(button, cryoModule.Dictionary.join({
					tag = "auto-xy shrink",
					LayoutOrder = 2,
					testId = "--banner-button-inline"
				}, var1.buttons[1])) else nil,
				Subcontent = if not var4 then reactModule.createElement(view, { tag = "auto-xy col gap-large shrink", LayoutOrder = 2 }, {
					Body = if var1.body then reactModule.createElement(text, {
						testId = "--banner-body",
						tag = "auto-xy text-body-medium content-default text-wrap text-align-x-left",
						LayoutOrder = 1,
						RichText = true,
						Text = var1.body
					}) else nil,
					Buttons = reactModule.createElement(view, {
						tag = "row auto-xy grow gap-small wrap",
						LayoutOrder = 2,
						testId = "--banner-buttons"
					}, reactModule.useMemo(function()
						-- upvalues: var1 (ref), reactModule (copy), button (copy), cryoModule (copy), foundationModule (copy)
						local t = {}
						
						if var1.buttons and #var1.buttons > 0 then
							for i, v in var1.buttons do
								t["banner-button-" .. i] = reactModule.createElement(button, cryoModule.Dictionary.join({
									LayoutOrder = i + 1,
									size = foundationModule.Enums.InputSize.Small,
									testId = "--banner-button-" .. i
								}, v))
							end
						end
						return t
					end, { var1.buttons }))
				}) else nil
			}),
			Dismiss = if not var3 then var5 else nil
		})
	})
end)