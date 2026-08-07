local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsModule = require(parent.Signals)
local useSignalBinding = require(parent.SignalsReact).useSignalBinding
local getRewriteDropdownStoreModule = require(expChat.Stores.GetRewriteDropdownStore)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local localizationModule = require(expChat.Localization)
local fStringInExpChatRewriteReasonKeyModule = require(expChat.Flags.FStringInExpChatRewriteReasonKey)
local mergeBindableScalarModule = require(expChat.ChatWindow.Helpers.mergeBindableScalar)

return reactModule.memo(function(p0) --[[ line: 25 | named "RewriteDropdown" ]]
	-- upvalues: foundationModule (ref), localizationModule (ref), fStringInExpChatRewriteReasonKeyModule (ref), getMessagesStoreModule (ref), getRewriteDropdownStoreModule (ref), reactModule (ref), signalsModule (ref), useSignalBinding (ref), mergeBindableScalarModule (ref)
	local var9 = foundationModule.Hooks.useTokens()
	local var10 = localizationModule.useLocalization({
		defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel",
		rewrittenReasonLabelText = fStringInExpChatRewriteReasonKeyModule
	})
	local var11 = if var10.rewrittenReasonLabelText and var10.rewrittenReasonLabelText ~= "" then var10.rewrittenReasonLabelText else var10.defaultRewrittenReasonLabelText
	local var12 = getMessagesStoreModule(false)
	local var13 = getRewriteDropdownStoreModule(false)
	local var14 = reactModule.useMemo(function() --[[ line: 40 ]]
		-- upvalues: signalsModule (copy), var13 (ref), var12 (ref)
		local var19 = signalsModule.createComputed(function(p1) --[[ line: 41 ]]
			-- upvalues: var13 (copy), var12 (copy)
			local componentId = var13.getComponentId(p1)
			
			if not componentId then
				return nil
			end
			local openMessageId = var13.getOpenMessageId(p1)
			
			if not openMessageId then
				return nil
			end
			local messageComponentSignal = var12.getMessageComponentSignal(componentId)
			
			if not messageComponentSignal then
				return nil
			end
			local var23 = messageComponentSignal(p1)
			
			if not var23 then
				return nil
			end
			local var24 = var12.getMessage(var23)(p1)
			
			return if var24 then if var23 == openMessageId then var24 else nil else nil
		end)
		
		return {
			getVisible = signalsModule.createComputed(function(p2) --[[ line: 69 ]]
				-- upvalues: var19 (ref)
				local var25 = var19(p2)
				
				return if var25 then var25.wasRewritten else false
			end),
			getLayoutOrder = signalsModule.createComputed(function(p3) --[[ line: 77 ]]
				-- upvalues: var13 (copy), var12 (copy)
				local componentId = var13.getComponentId(p3)
				
				if not componentId then
					return 0
				end
				local layoutOrderSignal = var12.getLayoutOrderSignal(componentId)
				
				return if layoutOrderSignal then layoutOrderSignal(p3) + 1 else 0
			end),
			getOriginalText = signalsModule.createComputed(function(p4) --[[ line: 89 ]]
				-- upvalues: var19 (ref)
				local var28 = var19(p4)
				
				return if var28 then var28.originalText or "" else ""
			end)
		}
	end, {})
	local var15 = useSignalBinding(var14.getVisible)
	local var16 = useSignalBinding(var14.getLayoutOrder)
	local var17 = useSignalBinding(var14.getOriginalText)
	local var18 = var17:map(function(p5) --[[ line: 107 ]]
		return p5 ~= nil and p5 ~= ""
	end)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = var16,
		Visible = var15
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var9.Padding.XXSmall),
			PaddingBottom = UDim.new(0, var9.Padding.XXSmall),
			PaddingRight = p0.arButtonPadding
		}),
		reactModule.createElement(foundationModule.View, {
			tag = "col align-x-left gap-xxsmall padding-small radius-medium size-full-0 auto-y",
			backgroundStyle = {
				Color3 = var9.Color.Common.Scrim.Color3,
				Transparency = mergeBindableScalarModule(0.7, p0.textTransparency)
			}
		}, {
			OriginalText = reactModule.createElement(foundationModule.Text, {
				tag = "text-body-small text-align-x-left text-wrap size-full-0 auto-y",
				LayoutOrder = 1,
				RichText = true,
				Text = var17,
				Visible = var18,
				textStyle = {
					Color3 = var9.Color.Content.Muted.Color3,
					Transparency = mergeBindableScalarModule(var9.Color.Content.Muted.Transparency, p0.textTransparency)
				},
				stroke = {
					Color = Color3.fromRGB(0, 0, 0),
					Transparency = mergeBindableScalarModule(0.5, p0.textTransparency),
					Thickness = var9.Stroke.Thin
				}
			}),
			Divider = reactModule.createElement(foundationModule.Divider, {
				LayoutOrder = 2,
				orientation = foundationModule.Enums.Orientation.Horizontal,
				Visible = reactModule.joinBindings({ p0.textTransparency, var18 }):map(function(p6) --[[ line: 150 ]]
					return p6[1] < 1 and p6[2]
				end),
				DividerVariant = foundationModule.Enums.DividerVariant.Default
			}),
			ReasoningText = reactModule.createElement(foundationModule.Text, {
				tag = "text-body-small text-align-x-left text-wrap size-full-0 auto-y",
				LayoutOrder = 3,
				RichText = true,
				Text = var11,
				textStyle = {
					Color3 = var9.Color.Content.Default.Color3,
					Transparency = mergeBindableScalarModule(var9.Color.Content.Default.Transparency, p0.textTransparency)
				},
				stroke = {
					Color = Color3.fromRGB(0, 0, 0),
					Transparency = mergeBindableScalarModule(0.5, p0.textTransparency),
					Thickness = var9.Stroke.Thin
				}
			})
		})
	})
end)