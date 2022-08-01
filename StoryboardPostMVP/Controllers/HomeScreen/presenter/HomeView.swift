//
//  HomeView.swift
//  StoryboardPostMVP
//
//  Created by Avaz Mukhitdinov on 30/07/22.
//

import Foundation


protocol HomeView{
    func LoedPosts(post: [Post])
    func DeletePost(deleted: Bool)
    
}
