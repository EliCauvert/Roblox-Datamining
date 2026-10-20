local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local ReactModule = require(CoreScriptsPlayerFeedback.Parent.React)
local _ = require(CoreScriptsPlayerFeedback.CaptureTypes)
local GetCaptureKeyModule = require(CoreScriptsPlayerFeedback.Utils.getCaptureKey)
local UploadCaptureAssetModule = require(CoreScriptsPlayerFeedback.Utils.uploadCaptureAsset)

return function()
	-- upvalues: ReactModule (copy), GetCaptureKeyModule (copy), UploadCaptureAssetModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef(0)
	
	return {
		uploadStatuses = UseStateResult,
		anyUploading = ReactModule.useMemo(function(): boolean
			-- upvalues: UseStateResult (copy)
			for _, value in UseStateResult do
				if value.status == "uploading" then
					return true
				end
			end
			return false
		end, { UseStateResult }),
		hasNonModerationFailure = ReactModule.useMemo(function(): boolean
			-- upvalues: UseStateResult (copy)
			for _, value in UseStateResult do
				if value.status == "failed" and value.failureReason ~= Enum.UploadCaptureResult.CaptureModerated then
					return true
				end
			end
			return false
		end, { UseStateResult }),
		onCapturesAdded = ReactModule.useCallback(function(List)
			-- upvalues: GetCaptureKeyModule (upval), UseStateResult (copy), UseStateResult2 (copy), UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UploadCaptureAssetModule (upval)
			local t = {}
			
			for _, value in List do
				t[GetCaptureKeyModule(value)] = value
			end
			local Captures = {}
			
			for i, value1 in t do
				if UseStateResult[i] == nil then
					table.insert(Captures, value1)
				end
			end
			UseStateResult2(function(List)
				-- upvalues: t (copy), Captures (copy), GetCaptureKeyModule (upval), UseRefResult (upval)
				local t1 = {}
				
				for i, value in List do
					if t[i] then
						t1[i] = value
					end
				end
				local Order = 0
				
				for _, value1 in List do
					if value1.order and Order < value1.order then
						Order = value1.order
					end
				end
				for _, capture in Captures do
					Order += 1
					local CaptureKeyModule = GetCaptureKeyModule(capture)
					local CurrentEntry = UseRefResult.current[CaptureKeyModule]
					
					if CurrentEntry then
						t1[CaptureKeyModule] = {
							capture = capture,
							status = CurrentEntry.status,
							assetId = CurrentEntry.assetId,
							failureReason = CurrentEntry.failureReason,
							order = Order
						}
					else
						t1[CaptureKeyModule] = {
							status = "uploading",
							assetId = nil,
							capture = capture,
							order = Order
						}
					end
				end
				return t1
			end)
			
			for _, capture in Captures do
				local CaptureKeyModule = GetCaptureKeyModule(capture)
				
				if not UseRefResult.current[CaptureKeyModule] and not UseRefResult1.current[CaptureKeyModule] then
					UseRefResult2.current += 1
					local Current = UseRefResult2.current
					UseRefResult1.current[CaptureKeyModule] = Current
					task.spawn(function()
						-- upvalues: UploadCaptureAssetModule (upval), capture (copy), UseRefResult1 (upval), CaptureKeyModule (copy), Current (copy), UseRefResult (upval), UseStateResult2 (upval)
						local UploadCaptureAssetModuleResult, UploadCaptureAssetModuleResult2 = UploadCaptureAssetModule(capture)
						
						if UseRefResult1.current[CaptureKeyModule] ~= Current then return end
						UseRefResult1.current[CaptureKeyModule] = nil
						local config = {
							order = nil,
							capture = capture,
							status = if UploadCaptureAssetModuleResult == nil then "failed" else "succeeded",
							failureReason = UploadCaptureAssetModuleResult2,
							assetId = UploadCaptureAssetModuleResult
						}
						
						if UploadCaptureAssetModuleResult ~= nil or UploadCaptureAssetModuleResult2 == Enum.UploadCaptureResult.CaptureModerated then
							UseRefResult.current[CaptureKeyModule] = config
						end
						UseStateResult2(function(Tbl)
							-- upvalues: CaptureKeyModule (upval), capture (upval), config (copy)
							if Tbl[CaptureKeyModule] then
								local Copy = table.clone(Tbl)
								Copy[CaptureKeyModule] = {
									capture = capture,
									status = config.status,
									failureReason = config.failureReason,
									assetId = config.assetId,
									order = Tbl[CaptureKeyModule] and Tbl[CaptureKeyModule].order
								}
								
								return Copy
							else
								return Tbl
							end
						end)
					end)
				end
			end
		end, { UseStateResult }),
		onCaptureRemoved = ReactModule.useCallback(function(p1)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(Tbl)
				-- upvalues: p1 (copy)
				local Copy = table.clone(Tbl)
				Copy[p1] = nil
				
				return Copy
			end)
		end, {})
	}
end