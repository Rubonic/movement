//package com.codingdojo.movement.controllers;
//
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//
//import com.neovisionaries.i18n.CountryCode;
//
//import se.michaelthelin.spotify.requests.data.playlists.GetPlaylistRequest;
//import se.michaelthelin.spotify.SpotifyApi;
//import se.michaelthelin.spotify.model_objects.specification.Playlist;
//
//public class SpotifyController {
//	private static SpotifyApi spotifyApi;
//	public SpotifyController() {
//		spotifyApi = new SpotifyApi.Builder()
//				  .setClientId("993c1dd456a547929dea7e5a0bdb101a")
//				  .setClientSecret("d0b7970418d44a609e786d7079be7c87")
//				  .build();
//		GetPlaylistRequest getPlaylist= spotifyApi.getPlaylist("qKRpDADUKrFeKhFHDMdfcu")
//		        .market(CountryCode.SE)
//		        .build();
//	}
//	
//	public static Playlist getPlaylist(String playlistId) {
//		  try {
//			  GetPlaylistRequest getPlaylist= spotifyApi.getPlaylist(playlistId)
//				        .market(CountryCode.SE)
//				        .build();
//		    // Execute the request synchronous
////		    GetPlayList something = getPlayList.execute();
//			  Playlist playlist=getPlaylist.execute();
//		    // Print something's name
//		    return playlist;
//		  } catch (Exception e) {
//		    System.out.println("Something went wrong!\n" + e.getMessage());
//		    return null;
//		  }
//		}
//	@GetMapping("/playlist/{id}")
//	public String findPlayList(@PathVariable("id")String id)
//	{
//		Playlist playlist=getPlaylist(id);
//		return null;
//	}
//}
