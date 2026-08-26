local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local checkbox = foundationModule.Checkbox
local image = foundationModule.Image
local scaleType = Enum.ScaleType
local text = foundationModule.Text
local view = foundationModule.View
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local componentSubtextModule = require(genericAbuseReporting.Bedui.Components.ComponentSubtext)
local getPlaceMediaAssetIdsModule = require(genericAbuseReporting.Bedui.Utils.getPlaceMediaAssetIds)
local useFormDataModule = require(genericAbuseReporting.Bedui.Provider.useFormData)
local uDim2 = UDim2.fromOffset(180, 101)
local t = { [abuseVectorModule.Place] = "THUMBNAIL_IDS" }

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useFormDataModule (ref), useRoactService (ref), roactNetworking (ref), abuseVectorModule (ref), getPlaceMediaAssetIdsModule (ref), t (ref), view (ref), checkbox (ref), image (ref), scaleType (ref), uDim2 (ref), text (ref), componentSubtextModule (ref)
	local var1, var2 = reactModule.useState({})
	local var3, var4 = reactModule.useState({})
	local custom = useFormDataModule().custom
	local updateForm = useFormDataModule().updateForm
	local updateAdditionalReportTags = useFormDataModule().updateAdditionalReportTags
	local var5 = useRoactService(roactNetworking)
	local var6 = reactModule.useRef(`selector-{DateTime.now()}`)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), abuseVectorModule (copy), getPlaceMediaAssetIdsModule (copy), var5 (ref), custom (ref), var2 (ref)
		if p1.abuseVector == abuseVectorModule.Place then
			getPlaceMediaAssetIdsModule(var5, tostring(custom and custom.universeId)):andThen(function(p2)
				-- upvalues: var2 (copy)
				var2(p2)
			end)
		end
	end, {
		p1.abuseVector,
		getPlaceMediaAssetIdsModule,
		var5,
		custom and custom.universeId
	})
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), p1 (ref), abuseVectorModule (copy), updateAdditionalReportTags (ref), var6 (ref), t (copy)
		var4(function(p3)
			-- upvalues: p2 (ref), p1 (copy), abuseVectorModule (copy), updateAdditionalReportTags (copy), var6 (copy), t (copy)
			local cloned = table.clone(p3)
			local index = table.find(cloned, p2)
			
			if index then
				table.remove(cloned, index)
			else
				table.insert(cloned, p2)
			end
			if p1.abuseVector == abuseVectorModule.Place then
				local joined = table.concat(cloned, ",")
				
				if updateAdditionalReportTags then
					updateAdditionalReportTags(var6.current, { tagKey = t[p1.abuseVector], tagValue = joined })
				end
			end
			return cloned
		end)
	end, { p1.component, p1.abuseVector, updateForm })
	
	return if #var1 == 0 then nil else reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Prompt = reactModule.createElement(text, {
			tag = "auto-xy",
			LayoutOrder = 0,
			Text = p1.component.selector.prompt
		}),
		CheckboxGroup = reactModule.createElement(view, { tag = "size-full-0 auto-y col", LayoutOrder = 1 }, reactModule.useMemo(function()
			-- upvalues: var1 (ref), reactModule (copy), view (copy), checkbox (copy), var3 (ref), var7 (ref), image (copy), scaleType (copy), uDim2 (copy)
			local t = {}
			
			for i, v in ipairs(var1) do
				table.insert(t, reactModule.createElement(view, {
					tag = "size-0-0 auto-xy row gap-small self-center border-radius-medium padding-small",
					LayoutOrder = i
				}, {
					Checkbox = reactModule.createElement(checkbox, {
						label = "",
						isChecked = table.find(var3, v) ~= nil,
						onActivated = function()
							-- upvalues: var7 (copy), v (ref)
							var7(v)
						end
					}),
					Image = reactModule.createElement(image, {
						Image = `rbxthumb://type=Asset&id={v}&w=768&h=432`,
						ScaleType = scaleType.Fit,
						Size = uDim2,
						onActivated = function()
							-- upvalues: var7 (copy), v (ref)
							var7(v)
						end
					})
				}))
			end
			return t
		end, { var1, var3 })),
		ComponentSubtext = reactModule.createElement(componentSubtextModule, {
			layoutOrder = 2,
			isErrorState = p1.isErrorState,
			isOptional = p1.component.isOptional,
			requirementMessage = p1.component.requirementMessage
		})
	})
end)