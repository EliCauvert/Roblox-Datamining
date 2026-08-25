local parent = script.Parent.Parent
local parent_1 = parent.Parent
local capturesCommonNetworking = require(parent.Networking).CapturesCommonNetworking
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local assetTypeModule = require(parent.Enums.AssetType)
local thumbnailStateModule = require(parent.Enums.ThumbnailState)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useState = reactModule.useState
local contentPostsThumbnailsInitialDelayTimeMs = game:DefineFastInt("ContentPostsThumbnailsInitialDelayTimeMs", 100)
local contentPostsThumbnailsMaxRetries = game:DefineFastInt("ContentPostsThumbnailsMaxRetries", 10)

local function makeThumbnailRequest(p0, p1, p2)
	-- upvalues: capturesCommonNetworking (ref), assetTypeModule (ref), thumbnailStateModule (ref)
	return p0(capturesCommonNetworking.GetThumbnailByAssetId.API({
		assetId = p1,
		assetType = assetTypeModule.Screenshot,
		size = p2
	})):andThen(function(p3)
		-- upvalues: thumbnailStateModule (copy)
		local var7 = p3.responseBody.data[1]
		
		return if var7.imageUrl and var7.imageUrl ~= "" and var7.state == thumbnailStateModule.Completed then var7.imageUrl else nil
	end):catch(function(_)
		return nil
	end):await()
end

return function(p4, p5, p6)
	-- upvalues: useDispatch (ref), useState (ref), useEffect (ref), contentPostsThumbnailsInitialDelayTimeMs (ref), contentPostsThumbnailsMaxRetries (ref), makeThumbnailRequest (ref)
	local var8 = useDispatch()
	local var9, var10 = useState("")
	local var11, var12 = useState(false)
	local text = tostring(p5) .. "x" .. tostring(p6)
	useEffect(function()
		-- upvalues: contentPostsThumbnailsInitialDelayTimeMs (copy), contentPostsThumbnailsMaxRetries (copy), var12 (ref), var10 (ref), p4 (ref), makeThumbnailRequest (copy), var8 (ref), text (ref)
		local var14 = false
		local var15 = contentPostsThumbnailsInitialDelayTimeMs
		local var16 = contentPostsThumbnailsMaxRetries
		var12(false)
		var10("")
		
		if p4 then
			task.spawn(function()
				-- upvalues: var14 (write), var16 (write), makeThumbnailRequest (copy), var8 (copy), p4 (copy), text (copy), var10 (copy), var12 (copy), var15 (write)
				while not var14 and var16 > 0 do
					local var17, var18 = makeThumbnailRequest(var8, p4, text)
					
					if var14 then break end
					if not var17 or not var18 then
						task.wait(var15 / 1000)
						var15 *= 2
						var16 -= 1
						continue
					end
					var10(var18)
					var12(true)
					
					return
				end
			end)
			
			return function()
				-- upvalues: var14 (write)
				var14 = true
			end
		end
	end, { p4, text })
	
	return var9, var11
end