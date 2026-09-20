use axum::{Router, routing::get};
use tokio::net::TcpListener;

#[tokio::main]
async fn main() {
    let app = Router::new().route("/api/info", get(info));
    let listener = TcpListener::bind("0.0.0.0:3000").await.unwrap();
    println!("Starting web server on :3000");
    axum::serve(listener, app).await.unwrap();
}

async fn info() -> String {
    "Mock server running on Axum: 0.8.9".to_string()
}
