//
//  ModalView.swift
//  anx
//
//  Created by Aiffah Kiysa Waafi on 10/05/23.
//

import SwiftUI

struct ModalView: View {
//    @Binding var showModal: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("ColorBackground").ignoresSafeArea()
                ScrollView{
                    VStack {
                        Spacer()
                        Text("Anxiety")
                            .foregroundColor(Color("ColorText"))
                            .font(.system(size: 28, weight: .bold, design: .default))
                            .padding(10)
                        Image("ImageModal")
                            .resizable()
                            .frame(width: 350, height: 180)
                            .padding(20)
                        VStack(alignment: .leading, spacing: 8){
                            Text("What is anxiety?")
                                .foregroundColor(Color("ColorText"))
                                .font(.system(size: 22, weight: .bold, design: .default))
                            Text("Occasional anxiety is a normal part of life. Many people worry about things such as health, money, or family problems. But anxiety disorders involve more than temporary worry or fear. For people with an anxiety disorder, the anxiety does not go away and can get worse over time. The symptoms can interfere with daily activities such as job performance, schoolwork, and relationships.")
                                .foregroundColor(Color("ColorText"))
                                .font(.system(size: 16, weight: .regular, design: .default))
                            Spacer()
                                .frame(height: 10)
                            VStack(alignment: .leading, spacing: 12){
                                Text("Types of anxiety disorders")
                                    .foregroundColor(Color("ColorText"))
                                    .font(.system(size: 22, weight: .bold, design: .default))
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Generalized anxiety disorder")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                    Text("Generalized anxiety disorder (GAD) usually involves a persistent feeling of anxiety or dread, which can interfere with daily life.")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 17, weight: .regular, design: .default))
                                }
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Panic disorder")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                    Text("People with panic disorder have frequent and unexpected panic attacks. Panic attacks are sudden periods of intense fear, discomfort, or sense of losing control even when there is no clear danger or trigger.")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 17, weight: .regular, design: .default))
                                }
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Social anxiety disorder")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                    Text("Social anxiety disorder is an intense, persistent fear of being watched and judged by others. For people with social anxiety disorder, the fear of social situations may feel so intense that it seems beyond their control.")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 17, weight: .regular, design: .default))
                                }
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Specific Phobias")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                    Text("people who have a specific phobia have an intense fear of, or feel intense anxiety about, specific types of objects or situations.")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 17, weight: .regular, design: .default))
                                }
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Social Phobia")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                    Text("People with social anxiety disorder have a general intense fear of, or anxiety toward, social or performance situations. They worry that actions or behaviors associated with their anxiety will be negatively evaluated by others, leading them to feel embarrassed.")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 17, weight: .regular, design: .default))
                                }
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Agoraphobia")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                    Text("People with agoraphobia have an intense fear of two or more of the following situations:\n- Using public transportation\n- Being in open spaces\n- Being in enclosed spaces\n- Standing in line or being in a crowd\n- Being outside of the home alone")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 17, weight: .regular, design: .default))
                                }
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Separation anxiety disorder")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                    Text("Separation anxiety is often thought of as something that only children deal with. However, adults can also be diagnosed with separation anxiety disorder. People with separation anxiety disorder fear being away from the people they are close to. They often worry that something bad might happen to their loved ones while they are not together.")
                                        .foregroundColor(Color("ColorText"))
                                        .font(.system(size: 17, weight: .regular, design: .default))
                                }
                            }
                            VStack(alignment: .leading, spacing: 8){
                                Text("Reference")
                                    .foregroundColor(Color("ColorText"))
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                Link(destination: URL(string: "https://www.nimh.nih.gov/health/topics/anxiety-disorders")!) {
                                    Text("https://www.nimh.nih.gov/health/topics/anxiety-disorders")
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }.padding(20)
                    }
                }
            }
            .toolbar {
                Button("Done") {
                    dismiss()
                }.foregroundColor(Color("ColorText"))
            }
        }
    }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView(showModal: <#Binding<Bool>#>)
//    }
//}
