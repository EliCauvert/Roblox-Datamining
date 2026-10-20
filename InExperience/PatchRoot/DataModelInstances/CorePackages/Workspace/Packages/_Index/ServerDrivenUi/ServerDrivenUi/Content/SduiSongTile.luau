local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local CryoModule = require(Parent.Cryo)
local UseSongAlbumArtFunction = require(Parent.Songbird).useSongAlbumArt
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local ExecuteActionFunction = SduiCoreSystemModule.executeAction
local SduiTileModule = require(ServerDrivenUi.Content.SduiTile)
local SduiTileFooterModule = require(ServerDrivenUi.Content.SduiTileFooter)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseSongAlbumArtFunction (copy), ReactModule (copy), SduiActionType (copy), ExecuteActionFunction (copy), SduiTileFooterModule (copy), SduiTileModule (copy), CryoModule (copy)
	local UseTokensResult = UseTokensFunction()
	local SongId = p1.songId
	local UseSongAlbumArtResult = UseSongAlbumArtFunction(SongId)
	
	return ReactModule.createElement(SduiTileModule, CryoModule.Dictionary.join(p1, {
		testId = "--sdui-song-tile",
		image = if p1.image and p1.image ~= "" then p1.image else UseSongAlbumArtResult.value,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), SduiActionType (upval), SongId (copy), ExecuteActionFunction (upval)
			if p1.onActivated then
				p1.onActivated()
				
				return
			else
				ExecuteActionFunction({
					actionType = SduiActionType.OpenSongDetail,
					actionParams = { songId = SongId }
				}, p1.analyticsContext, p1.sduiContext)
			end
		end, {
			p1.onActivated,
			p1.sduiContext,
			p1.analyticsContext,
			SongId
		}),
		footerComponent = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ReactModule (upval), SduiTileFooterModule (upval)
			return if p1.footerComponent then p1.footerComponent else ReactModule.createElement(SduiTileFooterModule, {
				testId = "--sdui-song-tile-footer-artist",
				leftText = p1.artistText
			})
		end, { p1.footerComponent, p1.artistText, UseTokensResult })
	}))
end)