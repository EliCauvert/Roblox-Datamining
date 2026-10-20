local Parent = script:FindFirstAncestor("AppBlox").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local BannerBadgeModule = require(script.Parent.BannerBadge)
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local config = {
	isContained = true,
	width = UDim.new(1, 0),
	tags = { container = "col auto-y" }
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), Button (copy), FoundationModule (copy), BannerBadgeModule (copy), IconButton (copy), View (copy), Icon (copy), Image (copy), Text (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Tag = "col auto-y"
	
	if JoinResult.isContained then
		Tag ..= " " .. "radius-medium padding-large stroke-standard stroke-default bg-shift-100"
	end
	local v1: boolean = JoinResult.badges and #JoinResult.badges > 0
	local NoOnDismiss: boolean = JoinResult.buttons and (#JoinResult.buttons < 2 and (not JoinResult.image and (not JoinResult.body and (not v1 and not JoinResult.onDismiss))))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: JoinResult (copy), ReactModule (upval), Button (upval), CryoModule (upval), FoundationModule (upval)
		local Elements = {}
		
		if JoinResult.buttons and #JoinResult.buttons > 0 then
			for i, button in JoinResult.buttons do
				Elements["banner-button-" .. i] = ReactModule.createElement(Button, CryoModule.Dictionary.join({
					LayoutOrder = i + 1,
					size = FoundationModule.Enums.InputSize.Small,
					testId = "--banner-button-" .. i
				}, button))
			end
		end
		return Elements
	end, { JoinResult.buttons })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: JoinResult (copy), ReactModule (upval), BannerBadgeModule (upval), CryoModule (upval)
		local Elements = {}
		
		if JoinResult.badges then
			for i, badge in ipairs(JoinResult.badges) do
				Elements["banner-badge-" .. i] = ReactModule.createElement(BannerBadgeModule, CryoModule.Dictionary.join({ testId = "--banner-badge-" .. i, LayoutOrder = i + 1 }, badge))
			end
		end
		return Elements
	end, { JoinResult.badges })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: JoinResult (copy), ReactModule (upval), IconButton (upval), v1 (copy), FoundationModule (upval)
		return if JoinResult.onDismiss then ReactModule.createElement(IconButton, {
			isCircular = true,
			testId = if v1 then "--banner-badges-dismiss" else "--banner-dismiss",
			LayoutOrder = if v1 then 1 else 3,
			icon = FoundationModule.Enums.IconName.XSmall,
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			onActivated = JoinResult.onDismiss
		}) else nil
	end, { JoinResult.onDismiss, v1 })
	
	return ReactModule.createElement(View, {
		testId = "--banner",
		LayoutOrder = JoinResult.LayoutOrder,
		Size = UDim2.new(JoinResult.width.Scale, JoinResult.width.Offset, 0, 0),
		tag = Tag
	}, {
		BadgesRow = if v1 then ReactModule.createElement(View, {
			tag = "row auto-y size-full-0 flex-between gap-large align-y-center padding-bottom-large",
			LayoutOrder = 2
		}, {
			Badges = ReactModule.createElement(View, {
				LayoutOrder = 1,
				testId = "--banner-badges",
				tag = "row auto-xy gap-small fill"
			}, UseMemoResult1),
			Dismiss = if UseMemoResult2 then ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, { Dismiss = UseMemoResult2 }) else nil
		}) else nil,
		ContentRow = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = {
				["row auto-y size-full-0 gap-large"] = true,
				["align-y-center"] = NoOnDismiss
			}
		}, {
			Icon = if JoinResult.icon and not JoinResult.image then ReactModule.createElement(Icon, {
				testId = "--banner-icon",
				LayoutOrder = 1,
				size = FoundationModule.Enums.IconSize.Large,
				name = JoinResult.icon,
				variant = JoinResult.iconVariant,
				style = JoinResult.iconStyle
			}) else nil,
			Image = if JoinResult.image then ReactModule.createElement(View, { tag = "auto-xy flex-none bg-shift-100 radius-medium" }, {
				Image = ReactModule.createElement(Image, {
					testId = "--banner-image",
					tag = "size-1800",
					Image = JoinResult.image,
					ScaleType = Enum.ScaleType.Fit
				})
			}) else nil,
			Content = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = {
					["auto-xy gap-small align-x-left fill"] = true,
					["col flex-fill"] = not NoOnDismiss,
					["row align-y-center flex-between"] = NoOnDismiss
				}
			}, {
				Title = ReactModule.createElement(Text, {
					testId = "--banner-title",
					tag = "auto-xy text-title-medium content-emphasis fill text-wrap text-align-x-left",
					LayoutOrder = 1,
					Text = JoinResult.title
				}),
				InlineButton = if NoOnDismiss and JoinResult.buttons and JoinResult.buttons[1] then ReactModule.createElement(Button, CryoModule.Dictionary.join({
					tag = "auto-xy shrink",
					LayoutOrder = 2,
					testId = "--banner-button-inline"
				}, JoinResult.buttons[1])) else nil,
				Subcontent = if NoOnDismiss then nil else ReactModule.createElement(View, { tag = "auto-xy col gap-large shrink", LayoutOrder = 2 }, {
					Body = if JoinResult.body then ReactModule.createElement(Text, {
						testId = "--banner-body",
						tag = "auto-xy text-body-medium content-default text-wrap text-align-x-left",
						LayoutOrder = 1,
						RichText = true,
						Text = JoinResult.body
					}) else nil,
					Buttons = ReactModule.createElement(View, {
						tag = "row auto-xy grow gap-small wrap",
						LayoutOrder = 2,
						testId = "--banner-buttons"
					}, UseMemoResult)
				})
			}),
			Dismiss = if v1 then nil else UseMemoResult2
		})
	})
end)