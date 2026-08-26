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

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), localizationModule (ref), fStringInExpChatRewriteReasonKeyModule (ref), getMessagesStoreModule (ref), getRewriteDropdownStoreModule (ref), reactModule (ref), signalsModule (ref), useSignalBinding (ref), mergeBindableScalarModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = localizationModule.useLocalization({
		defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel",
		rewrittenReasonLabelText = fStringInExpChatRewriteReasonKeyModule
	})
	local var3 = if var2.rewrittenReasonLabelText and var2.rewrittenReasonLabelText ~= "" then var2.rewrittenReasonLabelText else var2.defaultRewrittenReasonLabelText
	local var4 = getMessagesStoreModule(false)
	local var5 = getRewriteDropdownStoreModule(false)
	local var6 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var5 (ref), var4 (ref)
		local var7 = signalsModule.createComputed(function(p2)
			-- upvalues: var5 (copy), var4 (copy)
			local componentId = var5.getComponentId(p2)
			
			if not componentId then
				return nil
			end
			local openMessageId = var5.getOpenMessageId(p2)
			
			if not openMessageId then
				return nil
			end
			local messageComponentSignal = var4.getMessageComponentSignal(componentId)
			
			if not messageComponentSignal then
				return nil
			end
			local var8 = messageComponentSignal(p2)
			
			if not var8 then
				return nil
			end
			local var9 = var4.getMessage(var8)(p2)
			
			return if var9 then if var8 == openMessageId then var9 else nil else nil
		end)
		
		return {
			getVisible = signalsModule.createComputed(function(p2)
				-- upvalues: var7 (ref)
				local var8 = var7(p2)
				
				return if var8 then var8.wasRewritten else false
			end),
			getLayoutOrder = signalsModule.createComputed(function(p2)
				-- upvalues: var5 (copy), var4 (copy)
				local componentId = var5.getComponentId(p2)
				
				if not componentId then
					return 0
				end
				local layoutOrderSignal = var4.getLayoutOrderSignal(componentId)
				
				return if layoutOrderSignal then layoutOrderSignal(p2) + 1 else 0
			end),
			getOriginalText = signalsModule.createComputed(function(p2)
				-- upvalues: var7 (ref)
				local var8 = var7(p2)
				
				return if var8 then var8.originalText or "" else ""
			end)
		}
	end, {})
	local var7 = useSignalBinding(var6.getVisible)
	local var8 = useSignalBinding(var6.getLayoutOrder)
	local var9 = useSignalBinding(var6.getOriginalText)
	local var10 = var9:map(function(p2)
		return p2 ~= nil and p2 ~= ""
	end)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = var8,
		Visible = var7
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var1.Padding.XXSmall),
			PaddingBottom = UDim.new(0, var1.Padding.XXSmall),
			PaddingRight = p1.arButtonPadding
		}),
		reactModule.createElement(foundationModule.View, {
			tag = "col align-x-left gap-xxsmall padding-small radius-medium size-full-0 auto-y",
			backgroundStyle = {
				Color3 = var1.Color.Common.Scrim.Color3,
				Transparency = mergeBindableScalarModule(0.7, p1.textTransparency)
			}
		}, {
			OriginalText = reactModule.createElement(foundationModule.Text, {
				tag = "text-body-small text-align-x-left text-wrap size-full-0 auto-y",
				LayoutOrder = 1,
				RichText = true,
				Text = var9,
				Visible = var10,
				textStyle = {
					Color3 = var1.Color.Content.Muted.Color3,
					Transparency = mergeBindableScalarModule(var1.Color.Content.Muted.Transparency, p1.textTransparency)
				},
				stroke = {
					Color = Color3.fromRGB(0, 0, 0),
					Transparency = mergeBindableScalarModule(0.5, p1.textTransparency),
					Thickness = var1.Stroke.Thin
				}
			}),
			Divider = reactModule.createElement(foundationModule.Divider, {
				LayoutOrder = 2,
				orientation = foundationModule.Enums.Orientation.Horizontal,
				Visible = reactModule.joinBindings({ p1.textTransparency, var10 }):map(function(p2)
					return p2[1] < 1 and p2[2]
				end),
				DividerVariant = foundationModule.Enums.DividerVariant.Default
			}),
			ReasoningText = reactModule.createElement(foundationModule.Text, {
				tag = "text-body-small text-align-x-left text-wrap size-full-0 auto-y",
				LayoutOrder = 3,
				RichText = true,
				Text = var3,
				textStyle = {
					Color3 = var1.Color.Content.Default.Color3,
					Transparency = mergeBindableScalarModule(var1.Color.Content.Default.Transparency, p1.textTransparency)
				},
				stroke = {
					Color = Color3.fromRGB(0, 0, 0),
					Transparency = mergeBindableScalarModule(0.5, p1.textTransparency),
					Thickness = var1.Stroke.Thin
				}
			})
		})
	})
end)