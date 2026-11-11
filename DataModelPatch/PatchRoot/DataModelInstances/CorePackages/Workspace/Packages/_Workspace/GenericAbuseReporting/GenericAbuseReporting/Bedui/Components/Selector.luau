local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local Checkbox = FoundationModule.Checkbox
local Image = FoundationModule.Image
local ScaleType = Enum.ScaleType
local Text = FoundationModule.Text
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local AbuseVectorModule = require(GenericAbuseReporting.Enums.AbuseVector)
local ComponentSubtextModule = require(GenericAbuseReporting.Bedui.Components.ComponentSubtext)
local GetPlaceMediaAssetIdsModule = require(GenericAbuseReporting.Bedui.Utils.getPlaceMediaAssetIds)
local UseFormDataModule = require(GenericAbuseReporting.Bedui.Provider.useFormData)
local _UDim2 = UDim2.fromOffset(180, 101)
local config = { [AbuseVectorModule.Place] = "THUMBNAIL_IDS" }

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseFormDataModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AbuseVectorModule (copy), GetPlaceMediaAssetIdsModule (copy), config (copy), View (copy), Checkbox (copy), Image (copy), ScaleType (copy), _UDim2 (copy), Text (copy), ComponentSubtextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local Custom = UseFormDataModule().custom
	local UpdateForm = UseFormDataModule().updateForm
	local UpdateAdditionalReportTagsFunction = UseFormDataModule().updateAdditionalReportTags
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRefResult = ReactModule.useRef(`selector-{DateTime.now()}`)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), AbuseVectorModule (upval), GetPlaceMediaAssetIdsModule (upval), UseRoactServiceResult (copy), Custom (copy), UseStateResult2 (copy)
		if p1.abuseVector == AbuseVectorModule.Place then
			GetPlaceMediaAssetIdsModule(UseRoactServiceResult, (tostring(Custom and Custom.universeId))):andThen(function(Result)
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(Result)
			end)
		end
	end, {
		p1.abuseVector,
		GetPlaceMediaAssetIdsModule,
		UseRoactServiceResult,
		Custom and Custom.universeId
	})
	local UseResult = ReactModule.useCallback(function(Value)
		-- upvalues: UseStateResult2_1 (copy), p1 (copy), AbuseVectorModule (upval), UpdateAdditionalReportTagsFunction (copy), UseRefResult (copy), config (upval)
		UseStateResult2_1(function(Tbl)
			-- upvalues: Value (copy), p1 (upval), AbuseVectorModule (upval), UpdateAdditionalReportTagsFunction (upval), UseRefResult (upval), config (upval)
			local Copy = table.clone(Tbl)
			local FoundIndex: number? = table.find(Copy, Value)
			
			if FoundIndex then
				table.remove(Copy, FoundIndex)
			else
				table.insert(Copy, Value)
			end
			if p1.abuseVector == AbuseVectorModule.Place then
				local Joined = table.concat(Copy, ",")
				
				if UpdateAdditionalReportTagsFunction then
					UpdateAdditionalReportTagsFunction(UseRefResult.current, { tagKey = config[p1.abuseVector], tagValue = Joined })
				end
			end
			return Copy
		end)
	end, { p1.component, p1.abuseVector, UpdateForm })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), ReactModule (upval), View (upval), Checkbox (upval), UseStateResult1 (copy), UseResult (copy), Image (upval), ScaleType (upval), _UDim2 (upval)
		local Elements = {}
		
		for LayoutOrder, value in ipairs(UseStateResult) do
			table.insert(Elements, ReactModule.createElement(View, {
				tag = "size-0-0 auto-xy row gap-small self-center border-radius-medium padding-small",
				LayoutOrder = LayoutOrder
			}, {
				Checkbox = ReactModule.createElement(Checkbox, {
					label = "",
					isChecked = table.find(UseStateResult1, value) ~= nil,
					onActivated = function()
						-- upvalues: UseResult (upval), value (copy)
						UseResult(value)
					end
				}),
				Image = ReactModule.createElement(Image, {
					Image = `rbxthumb://type=Asset&id={value}&w=768&h=432`,
					ScaleType = ScaleType.Fit,
					Size = _UDim2,
					onActivated = function()
						-- upvalues: UseResult (upval), value (copy)
						UseResult(value)
					end
				})
			}))
		end
		return Elements
	end, { UseStateResult, UseStateResult1 })
	
	return if #UseStateResult == 0 then nil else ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Prompt = ReactModule.createElement(Text, {
			tag = "auto-xy",
			LayoutOrder = 0,
			Text = p1.component.selector.prompt
		}),
		CheckboxGroup = ReactModule.createElement(View, { tag = "size-full-0 auto-y col", LayoutOrder = 1 }, UseMemoResult),
		ComponentSubtext = ReactModule.createElement(ComponentSubtextModule, {
			layoutOrder = 2,
			isErrorState = p1.isErrorState,
			isOptional = p1.component.isOptional,
			requirementMessage = p1.component.requirementMessage
		})
	})
end)